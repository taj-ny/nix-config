{
  config,
  lib,
  ...
}:

lib.mkIf config.programs.prism-launcher.enable
{
  custom.impermanence.persistentDirectories = [
    {
      directory = ".local/share/PrismLauncher";
      method = "symlink";
    }
  ];
}