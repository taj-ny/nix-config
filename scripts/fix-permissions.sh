#!/usr/bin/env bash

cd /nix/config
chown nixconfig:nixconfig -R .
chown root:root -R .git *.sh **/*.sh scripts
