{
  lib,
  pkgs,
  ...
}:

lib.mkProgramOption rec {
  name = "KDE Connect";
  optionName = "kdeconnect";
  package = pkgs.kdePackages.kdeconnect-kde;
  persistentDirectories = [ ".config/kdeconnect" ];
  customConfig.services.kdeconnect = {
    inherit package;
    enable = true;
  };
}