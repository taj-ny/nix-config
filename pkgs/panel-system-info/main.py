#!/usr/bin/env python3

import os
import psutil
import time
from subprocess import Popen, PIPE

color_red = "\033[91m"
color_green = "\033[92m"
color_yellow = "\033[93m"
color_reset = "\033[0m"

bar_length = 9
bar_symbol = "󱘹"

spacing = 2
spacing_char = "⠀"
separator = spacing_char * spacing

def to_gib_str(bytes):
    return f"{round(bytes / 1024 / 1024 / 1024, 1):.1f}"

def bar(name, value, max_value, threshold_yellow, threshold_red, text):
    s = ""
    fill_color = ""

    if value / max_value >= threshold_red:
        fill_color = color_red
    elif value / max_value >= threshold_yellow:
        fill_color = color_yellow
    else:
        fill_color = color_green

    for i in range(bar_length):
        if (i / bar_length) < (value / max_value):
            s += f"{fill_color}{bar_symbol}{color_reset}"
        else:
            s += bar_symbol

    return f"<b>{name}</b>{spacing_char}{s}{spacing_char}{fill_color}{text}{color_reset}"

def get_total_power_consumption():
    power_supply_path = "/sys/class/power_supply/"
    total_power_now = 0.0

    try:
        with open("/sys/class/power_supply/AC/online", "r") as online_file:
            if online_file.read().strip() == "1":
                return None

    except FileNotFoundError:
        return None

    for device in os.listdir(power_supply_path):
        device_path = os.path.join(power_supply_path, device)
        if os.path.isdir(device_path) and device.startswith("BAT"):
            current_now_path = os.path.join(device_path, "current_now")

            try:
                with open(os.path.join(device_path, "power_now"), "r") as power_file:
                    power_now = int(power_file.read().strip()) / 1_000_000
                total_power_now += power_now

            except FileNotFoundError:
                continue

    return total_power_now if total_power_now > 0 else None

cpu = round(psutil.cpu_percent(interval=1, percpu=False))
cpu_temp = round(psutil.sensors_temperatures()["coretemp"][0].current)
cpu_freq = psutil.cpu_freq().current
cpu_freq_suffix = "MHz"
if cpu_freq >= 1000:
    cpu_freq_suffix = "GHz"
    cpu_freq = f"{round(cpu_freq / 1000, 1):.1f}"
else:
    cpu_freq = round(cpu_freq)

ram = psutil.virtual_memory()
ram_text = f"{round((ram.total - ram.available) / 1024 / 1024 / 1024, 1):.1f} GiB"
if os.path.exists("/dev/zram0"):
    p = Popen("zramctl /dev/zram0 -b -o DATA,COMPR -n", shell=True, stdout=PIPE)

    output = p.stdout.readline().decode("utf-8").strip().split(" ")
    data = int(output[0]) if output[0].isdecimal() else 0
    compressed = int(output[1]) if output[1].isdecimal() else 0

    if data > 0.1 * 1024 * 1024 * 1024:
        ram_text += f" {color_reset}({to_gib_str(data)} -> {to_gib_str(compressed)})"

cpu_temp_color = color_green
if cpu_temp >= 90:
    cpu_temp_color = color_red
elif cpu_temp >= 80:
    cpu_temp_color = color_yellow

elements = [
    bar("CPU", cpu / 100, 1, 0.7, 0.9, f"{cpu}% "),
    f"({cpu_freq} {cpu_freq_suffix}, {cpu_temp_color}{cpu_temp} °C{color_reset})",
    separator,
    bar("RAM", ram.total - ram.available, ram.total, 0.7, 0.9, ram_text)
]

power_consumption = get_total_power_consumption()
if power_consumption is not None:
    elements.insert(0, separator)
    elements.insert(0, f"{round(power_consumption, 2)} W")

print("".join(element for element in elements))