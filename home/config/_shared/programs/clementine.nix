{
  config,
  lib,
  ...
}:

lib.mkIf config.programs.clementine.enable
{
  custom.impermanence.persistentDirectories = [
    ".cache/Clementine"
    ".config/Clementine"
  ];
}