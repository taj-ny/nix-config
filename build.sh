#!/usr/bin/env bash
shopt -s extglob

CONFIGURATION=$HOST
if [ -n "$1" ]; then
    CONFIGURATION=$1
fi

echo -e "\033[1;34minfo:\033[0m copying files..."
CONFIG_TMP=$(mktemp -d)
cp -r !(.git) $CONFIG_TMP

nixos-rebuild build --show-trace --flake $CONFIG_TMP#$CONFIGURATION --log-format internal-json -v |& nom --json
rm -r $CONFIG_TMP