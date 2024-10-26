{
  lib,
  pkgs,
  ...
}:

lib.mkProgramOption rec {
  name = "KDE Connect";
  optionName = "kdeconnect";
  package = pkgs.python311Packages.deemix;
  persistentDirectories = [ ".config/kdeconnect" ];
  customConfig.services.kdeconnect = {
    inherit package;
    enable = true;
  };
}