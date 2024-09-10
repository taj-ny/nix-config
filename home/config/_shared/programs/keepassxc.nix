{
  config,
  lib,
  ...
}:

lib.mkIf config.programs.keepassxc.enable
{
  custom.impermanence.persistentDirectories = [
    ".cache/keepassxc"
    ".config/keepassxc"
  ];
}