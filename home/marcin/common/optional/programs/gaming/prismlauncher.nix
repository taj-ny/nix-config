{ pkgs, ... }:

{
  home.packages = with pkgs; [ prismlauncher ];
  custom.impermanence.persistentDirectories = [ ".local/share/PrismLauncher" ];
}
