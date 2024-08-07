#!/usr/bin/env bash

shopt -s extglob

cd /nix/config
chown marcin:users -R .
chown root:root -R .git *.sh .vscode/tasks* **/*.sh scripts
