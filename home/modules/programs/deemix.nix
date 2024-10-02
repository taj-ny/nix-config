{
  lib,
  pkgs,
  ...
}:

lib.mkProgramOption {
  name = "deemix";
  package = pkgs.python311Packages.deemix;
  persistentFiles = [ ".config/deemix/.arl" ];
}