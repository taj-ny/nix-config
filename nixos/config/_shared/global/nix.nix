{
  inputs,
  lib,
  outputs,
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
}
