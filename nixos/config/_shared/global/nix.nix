{
  inputs,
  lib,
  outputs,
  ...
}:

{
  nix = {
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };
    nixPath = [ "nixpkgs=${inputs.nixpkgs.outPath}" ];
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;
    settings = {
      auto-optimise-store = true;
      experimental-features = "nix-command flakes";
    };
  };
  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable
    ];
  };
}
