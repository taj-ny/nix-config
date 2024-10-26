#!/usr/bin/env bash
set -e

if [ "$EUID" = 0 ]; then
    echo "This script cannot be executed as root."
    exit 1
fi

rm -f ~/.gtkrc-2.0

sudo rm -rf /tmp/nix-config
sudo cp -r /nix/config /tmp/nix-config
sudo chown root:root -R /tmp/nix-config
sudo rm -rf /tmp/nix-config/.git

if test -f /etc/current-config; then
    EXIT_CODE=0
    diff -r --exclude=.git $(cat /etc/current-config) /tmp/nix-config > /dev/null 2>&1 || EXIT_CODE=$?
    if [ $EXIT_CODE = 0 ]; then
        echo "No changes."
        exit 1
    fi
    diff -Naur --color=always --exclude=.git --exclude=result $(cat /etc/current-config) /tmp/nix-config | less -R
    read -n 1 -p "Switch? (y/n)" confirm
    if [ "$confirm" = "${confirm#[Yy]}" ]; then
        exit 1
    fi
else
    echo -e "\033[1;33mwarning:\033[0m /etc/current-config not found. Cannot show diff."
fi

substituters="https://cache.nixos.org"
nixServePort=5000
if [ "$(hostname)" = "andromeda" ] && ping -c 1 -W 1 thinkpad > /dev/null 2>&1; then
    substituters="http://thinkpad:$nixServePort $substituters"
elif [ "$(hostname)" = "thinkpad" ] && ping -c 1 -W 1 andromeda > /dev/null 2>&1; then
    substituters="http://andromeda:$nixServePort $substituters"
fi
sudo nixos-rebuild switch --option substituters "$substituters" --flake /tmp/nix-config#$HOST --log-format internal-json -v |& nom --json
