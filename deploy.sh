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
cd /tmp/nix-config

if test -f /etc/current-config; then
    EXIT_CODE=0
    diff -r --exclude=.git $(cat /etc/current-config) /nix/config > /dev/null 2>&1 || EXIT_CODE=$?
    if [ $EXIT_CODE = 0 ]; then
        echo "No changes."
        exit 1
    fi
    diff -Naur --color=always --exclude=.git $(cat /etc/current-config) /nix/config | less -R
    read -n 1 -p "Deploy? (y/n)" confirm
    echo $confirm > /home/marcin/test
    if [ "$confirm" = "${confirm#[Yy]}" ]; then
        exit 1
    fi
else
    echo -e "\033[1;33mwarning:\033[0m /etc/current-config not found. Cannot show diff."
fi

sudo nixos-rebuild switch --flake .#$HOST --log-format internal-json -v |& nom --json