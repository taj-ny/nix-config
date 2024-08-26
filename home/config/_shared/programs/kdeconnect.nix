{
  config,
  lib,
  pkgs,
  ...
}:

lib.mkIf config.services.kdeconnect.enable
{
  custom.impermanence.persistentDirectories = [ ".config/kdeconnect" ];
  services.kdeconnect.package = pkgs.kdePackages.kdeconnect-kde;
}