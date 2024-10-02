{
  lib,
  pkgs,
  ...
}:

lib.mkProgramOption {
  name = "Prism Launcher";
  package = pkgs.prismlauncher;
  persistentDirectories = [ ".local/share/PrismLauncher" ];
}