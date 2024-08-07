#!/bin/sh

nixos-rebuild switch --show-trace --flake .#$1 --log-format internal-json -v |& nom --json