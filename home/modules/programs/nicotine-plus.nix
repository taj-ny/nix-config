{
  lib,
  pkgs,
  ...
}:

lib.mkProgramOption {
  name = "Nicotine+";
  optionName = "nicotine-plus";
  package = pkgs.nicotine-plus;
  persistentDirectories = [
    ".config/nicotine"
    ".local/share/nicotine"
  ];
}