#!/usr/bin/env bash
set -e
set -o pipefail

nix shell nixpkgs#dconf2nix --command /usr/bin/env bash -c "dconf dump /com/github/wwmm/easyeffects/ | dconf2nix -r com/github/wwmm/easyeffects | sudo tee _preset.nix"
