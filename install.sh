#!/usr/bin/env bash
set -e

nix --extra-experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko "$DISK_LAYOUT" --arg disks '[ "'"$DISK"'" ]'

cd ..
chown -R root:root nix-config
chmod -R 755 nix-config
mv nix-config /mnt/nix/config
cd /mnt/nix/config

btrfs filesystem mkswapfile --size "$SWAPSIZE" /mnt/swap/swapfile
swapon /mnt/swap/swapfile

mkdir /mnt/persist/passwords
chmod 700 /mnt/persist/passwords
mkpasswd -m sha-512 > /mnt/persist/passwords/marcin

nixos-generate-config --no-filesystems --show-hardware-config > "nixos/$CONFIGURATION/hardware-configuration.nix"
git add "nixos/$CONFIGURATION/hardware-configuration.nix"

nixos-install --flake ".#$CONFIGURATION"

#reboot
