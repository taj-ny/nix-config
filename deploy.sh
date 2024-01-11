#!/usr/bin/env bash
set -e

hostname=$(cat /etc/hostname)

while getopts "hnu" opt; do
    case "${opt}" in
        h) deploy_home=true;;
        n) deploy_nixos=true;;
        u) update_flake=true;;
    esac
done

# All commands are combined into one script so that doas doesn't ask twice for the password.
if [ "$update_flake" = true ]; then
    root_commands=$(cat <<-EOF
        flake_before=\$(cat flake.lock)
        nix flake update
        if [ "\$flake_before" == "\$(cat flake.lock)" ]; then
            echo "No updates available."
            exit 1
        fi;
EOF
    )
fi


root_commands+=$(cat <<-EOF
    rm -rf /tmp/nix-config
    cp -r /nix/config /tmp/nix-config
    chown root:root -R /tmp/nix-config
    cd /tmp/nix-config

    if ! git diff HEAD --exit-code > /dev/null 2>&1; then
        git --no-pager diff HEAD
        echo "Deploy? (y/n): "
        read deploy
        if [ "\$deploy" = "\${deploy#[Yy]}" ]; then
            exit 1
        fi
    fi;
EOF
)

if [ "$deploy_nixos" = true ]; then
    root_commands+="nixos-rebuild switch --flake .#$hostname"
fi

if [ -n "$root_commands" ]; then
    if [ "$EUID" = 0 ]; then
        sh -c "$root_commands"
    else
        doas sh -c "$root_commands"
    fi
fi

cd /tmp/nix-config
if [ "$deploy_home" = true ]; then
    if [ "$EUID" = 0 ]; then
        echo "Home configuration cannot be deployed if the script is executed as root."
        exit 1
    fi

    # Remove files created by KDE that could cause conflicts.
    rm -rf ~/.config/gtk-*
    rm -f ~/.gtkrc-2.0

    # This directory is not present on a fresh installation, which prevents home-manager from working at all.
    mkdir -p ~/.local/state/nix/profiles

    # /tmp is very likely to run out of free space when unpacking multiple JetBrains IDEs at the same time, so the
    # amount of jobs is limited to 2.
    home-manager switch --flake ".#$USER@$hostname" -j 2
fi
