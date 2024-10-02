{
  lib,
  pkgs,
  ...
}:

lib.mkProgramOption {
  name = "Clementine";
  package = pkgs.clementine;
  persistentDirectories = [
    ".cache/Clementine"
    ".config/Clementine"
  ];
}