#!/bin/sh

# A wrapper script for git that copies my ssh keys to root's directory in order to make it easier to manage the repository in a root-owned directory with 755 permissions.

if (( $EUID != 0 )); then
    echo "Please run as root"
    exit
fi

mkdir -p /root/.ssh
cp /home/marcin/.ssh/* /root/.ssh
git "$@"
rm -r /root/.ssh
