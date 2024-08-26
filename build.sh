#!/usr/bin/env bash
shopt -s extglob

CONFIGURATION=$HOST
if [ -n "$1" ]; then
    CONFIGURATION=$1
fi

CONFIG_TMP=$(mktemp -d)
cp -r !(.git) $CONFIG_TMP
nixos-rebuild build --show-trace --flake $CONFIG_TMP#$CONFIGURATION --log-format internal-json -v |& nom --json
rm -r $CONFIG_TMP