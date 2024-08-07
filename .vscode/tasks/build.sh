#!/bin/sh

nixos-rebuild switch --flake .#$1 --log-format internal-json -v |& nom --json