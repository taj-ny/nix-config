import json
import os

file = open(os.path.expanduser("~/.config/nixos-update-notifier"), "r")
watched_inputs = file.read().split("\n")
watched_inputs.pop()
file.close()

flake_before = {}
flake_after = {}

def parse_flake_lock(flake_dict, flake_lock):
    file = open(flake_lock, "r")
    flake_lock_json = json.load(file)
    file.close()

    for key in flake_lock_json["nodes"]:
        if key not in watched_inputs:
            continue

        input = flake_lock_json["nodes"][key]["locked"]
        flake_dict[key] = input["lastModified"]

parse_flake_lock(flake_before, "/tmp/flake.lock.tmp" if os.path.isfile("/tmp/flake.lock.tmp") else "/nix/config/flake.lock")
os.system("nix flake update /nix/config --output-lock-file /tmp/flake.lock.tmp")
parse_flake_lock(flake_after, "/tmp/flake.lock.tmp")

updates = []
for input in watched_inputs:
    if flake_after[input] > flake_before[input]:
        updates.append(input)

updates_str = "\n".join(map(lambda x: "\\- " + x, updates))

if len(updates) > 0:
    os.system(f"notify-send -i nix-snowflake -a 'NixOS Update Notifier' '{len(updates)} update{'s' if len(updates) > 1 else ''} available' '{updates_str}'")
