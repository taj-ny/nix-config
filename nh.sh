#!/usr/bin/env bash
set -e

if [ "$EUID" = 0 ]; then
    echo "This script cannot be executed as root."
    exit 1
fi

sudo sh -c "$(cat <<-EOF
    rm -rf /tmp/nix-config
    cp -r /nix/config /tmp/nix-config
    chown root:root -R /tmp/nix-config
    cd /tmp/nix-config

    if ! git diff HEAD --exit-code > /dev/null 2>&1; then
        git --no-pager diff HEAD
        echo "Deploy? (y/n): "
        read confirm
        if [ "\$confirm" = "\${confirm#[Yy]}" ]; then
            exit 1
        fi
    fi;
EOF
)"

FLAKE=/tmp/nix-config nh --verbose $@
