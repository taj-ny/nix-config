#!/bin/sh

cd /nix/config
chown nixconfig:nixconfig -R .
chown root:root -R .git *.sh scripts
