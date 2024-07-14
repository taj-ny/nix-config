{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.custom.programs.prismlauncher;
in
{
  options.custom.programs.prismlauncher.enable = mkEnableOption "Prism Launcher";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ prismlauncher ];

    custom.impermanence.persistentDirectories = [ 
      {
        directory = ".local/share/PrismLauncher";
        method = "symlink";
      }
    ];
  };
}
