#!/usr/bin/env bash
set -e

rm -f ~/.gtkrc-2.0

sudo rm -rf /tmp/nix-config
sudo cp -r /nix/config /tmp/nix-config
sudo chown root:root -R /tmp/nix-config
cd /tmp/nix-config

if ! git diff HEAD --exit-code > /dev/null 2>&1; then
    git --no-pager diff HEAD
    echo "Deploy? (y/n): "
    read confirm
    if [ "\$confirm" = "\${confirm#[Yy]}" ]; then
        exit 1
    fi
fi;

sudo nixos-rebuild switch --flake .#$HOST --log-format internal-json -v |& nom --json