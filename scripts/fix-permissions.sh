#!/bin/sh

cd /nix/config
chown root:root -R .
chown marcin:users -R home images lib nixos overlays pkgs .editorconfig .gitignore flake.nix LICENSE nixpkgs.nix README.md shell.nix
