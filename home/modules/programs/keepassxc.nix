{
  lib,
  pkgs,
  ...
}:

lib.mkProgramOption {
  name = "KeepassXC";
  package = pkgs.keepassxc;
  persistentDirectories = [
    ".cache/keepassxc"
    ".config/keepassxc"
  ];
}