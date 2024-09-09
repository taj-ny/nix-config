{
  inputs,
  lib,
  outputs,
  pkgs,
  ...
}:

{
  nix = {
    buildMachines =
      let
        ssh = {
          sshKey = "/nix/nixbuild_id_ed25519";
          sshUser = "nixbuild";
        };
      in
      lib.map (machine: machine // ssh) [
        {
          hostName = "andromeda";
          maxJobs = 4;
          speedFactor = 1;
          system = "x86_64-linux";
        }
        {
          hostName = "thinkpad";
          maxJobs = 8;
          speedFactor = 2;
          system = "x86_64-linux";
        }
      ];
    #distributedBuilds = true;
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
      trusted-users = [ "nixbuild" ];
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
  users = {
    groups.nixbuild = {};
    users.nixbuild = {
      isSystemUser = true;
      group = "nixbuild";
      shell = pkgs.bash;

      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJbqB/u25wyLkT2DW1ZW2cRsgjFcpWsjTm++tTsL4xn1 root@andromeda"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIsbYYc1NmPplLOmhbiY+E6PZrt5FNq6x75QGrvPSGHE root@thinkpad"
      ];
    };
  };
}
