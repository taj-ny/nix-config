{
  lib,
  pkgs,
  ...
}:

lib.mkProgramOption {
  name = "Clementine";
  package = pkgs.clementine;
  persistentDirectories = [ ".config/Clementine" ];
}