{ pkgs, lib, inputs, ... }:

{
  imports = [
    inputs.lanzaboote.nixosModules.lanzaboote
  ];

  environment.systemPackages = with pkgs; [ sbctl ];

  boot = {
    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };

    loader.systemd-boot.enable = lib.mkForce false;
  };
}
