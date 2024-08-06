#!/usr/bin/env bash

cd /nix/config
chown marcin:users -R .
chown root:root -R .git *.sh .vscode/tasks.json **/*.sh scripts
