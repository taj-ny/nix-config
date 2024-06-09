#!/usr/bin/env bash
set -e

# Usage: ./add_u2f_key.sh username

if [ "$EUID" -ne 0 ]; then
    echo "This script needs to be executed as root."
    exit 1
fi

if [ $# -eq 0 ]; then
    echo "Missing username."
    exit 1
fi

echo "Adding key for $1"
nix shell nixpkgs#pam_u2f --command sh -c "pamu2fcfg --username=$1 >> /nix/persist/u2f_keys"
