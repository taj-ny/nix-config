{
  inputs,
  lib,
  outputs,
  pkgs,
  ...
}:

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
      trusted-public-keys = [
        "andromeda:RKWnCuVLtIChwcxy6ti8u8SH+9ye2peaSlrTjVRQiCk="
        "thinkpad:84A19lzQ57U6+bRnNzjqiTTm4stGeIZ/cCJV8DtveXk="
      ];
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
  services.nix-serve = {
    enable = true;
    secretKeyFile = "/nix/nix-serve/private-key";
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
