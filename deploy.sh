#!/usr/bin/env bash
set -e

if [ "$EUID" = 0 ]; then
    echo "Do not run as root."
    exit 1
fi

hostname=$(cat /etc/hostname)

while getopts "hnu" opt; do
    case "${opt}" in
        h) deploy_home=true;;
	n) deploy_nixos=true;;
	u) update_flake=true;;
    esac
done

cd /nix/config

if [ "$update_flake" = true ]; then
    root_commands+="flake_before=\$(cat flake.lock); nix flake update; if [ \"\$flake_before\" == \"\$(cat flake.lock)\" ]; then echo \"flake.lock hasn't changed. Exiting.\"; exit 2; fi; ";
fi

if [ "$deploy_nixos" = true ]; then
    root_commands+="nixos-rebuild switch --flake .#$hostname"
    if [ "$?" = 2 ]; then exit 2; fi
fi


if [ -n "$root_commands" ]; then
    doas sh -c "$root_commands"
fi

if [ "$deploy_home" = true ]; then
    # Remove files created by KDE that could cause conflicts
    rm -rf ~/.config/gtk-*
    rm -f ~/.gtkrc-2.0

    mkdir -p ~/.local/state/nix/profiles
    home-manager switch --flake ".#$USER@$hostname" -j 1
fi
