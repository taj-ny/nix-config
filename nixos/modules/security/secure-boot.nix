{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.custom.security.secureBoot;
in
{
  imports = [
    inputs.lanzaboote.nixosModules.lanzaboote
  ];

  options.custom.security.secureBoot.enable = mkEnableOption "Secure Boot";

  config = mkIf cfg.enable {
    boot = {
      lanzaboote = {
        enable = true;
        pkiBundle = "/etc/secureboot";
      };

      loader.systemd-boot.enable = lib.mkForce false;
    };

    environment.systemPackages = with pkgs; [ sbctl ];
  };
}