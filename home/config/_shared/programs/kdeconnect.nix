{
  config,
  lib,
  pkgs,
  ...
}:

lib.mkIf config.services.kdeconnect.enable
{
  persistence.directories = [ ".config/kdeconnect" ];
  services.kdeconnect.package = pkgs.kdePackages.kdeconnect-kde;
}