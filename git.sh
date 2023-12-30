#!/bin/sh

# This script makes it easier to manage the git repository in a root-owned directory with 755 permissions.

if (( $EUID != 0 )); then
    echo "Please run as root"
    exit
fi

HOME=/home/marcin

mkdir -p /root/.ssh
cp $HOME/.ssh/* /root/.ssh

git -c "include.path=$HOME/.config/git/config" "$@"

rm -r /root/.ssh
