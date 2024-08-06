{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.custom.programs.kdeconnect;
in
{
  options.custom.programs.kdeconnect.enable = mkEnableOption "KDE Connect";

  config = mkIf cfg.enable {
    services.kdeconnect = {
      enable = true;
      package = pkgs.kdePackages.kdeconnect-kde;
    };

    custom.impermanence.persistentDirectories = [ ".config/kdeconnect" ]; 
  };
}
