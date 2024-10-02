{
  lib,
  pkgs,
  ...
}:

lib.mkProgramOption {
  name = "Yakuake";
  package = pkgs.kdePackages.yakuake;
}