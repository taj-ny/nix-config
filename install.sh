#!/usr/bin/env bash
set -e

sudo nix --extra-experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko "$DISK_LAYOUT" --arg disks '[ "'"$DISK"'" ]'

cd ..
sudo chown -R root:root nix-config
sudo chmod -R 755 nix-config
sudo mv nix-config /mnt/nix/config
cd /mnt/nix/config

sudo btrfs filesystem mkswapfile --size "$SWAPSIZE" /mnt/swap/swapfile
sudo swapon /mnt/swap/swapfile

sudo mkdir /mnt/persist/passwords
sudo chmod 700 /mnt/persist/passwords
mkpasswd -m sha-512 | sudo tee /mnt/persist/passwords/marcin

sudo nixos-generate-config --no-filesystems --show-hardware-config | sudo tee /tmp/hardware-configuration.nix
sudo vim /tmp/hardware-configuration.nix
sudo mv -f /tmp/hardware-configuration.nix "nixos/$CONFIGURATION"
sudo git add "nixos/$CONFIGURATION/hardware-configuration.nix"

sudo nixos-install --flake ".#$CONFIGURATION"

sudo reboot
