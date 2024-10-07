{
  lib,
  pkgs,
  ...
}:

lib.mkProgramOption {
  name = "KeepassXC";
  package = pkgs.keepassxc;
  persistentDirectories = [ ".config/keepassxc" ];
}