{ inputs, outputs, lib, pkgs, ... }:

{
  nix = {
    nixPath = [ "nixpkgs=${inputs.nixpkgs.outPath}" ];
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };

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
      outputs.overlays.stable-packages
    ];
  };

  # Owner of the /nix/config directory.
  users = {
    groups.nixconfig = { };
    users.nixconfig = {
      createHome = true;
      group = "nixconfig";
      home = "/tmp/nixconfig";
      isSystemUser = true;
      shell = pkgs.bash;
    };
  };
}
