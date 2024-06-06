{ config, inputs, lib, pkgs, ... }:

with lib;
let
  cfg = config.modules.security.secureBoot;
in
{
  imports = [
    inputs.lanzaboote.nixosModules.lanzaboote
  ];

  options.modules.security.secureBoot.enable = mkEnableOption "Secure Boot";

  config = mkIf cfg.enable {
    boot = {
      lanzaboote = {
        enable = true;
        pkiBundle = "/etc/secureboot";
      };

      loader.systemd-boot.enable = lib.mkForce false;
    };

    environment.systemPackages = [ pkgs.sbctl ];
  };
}
