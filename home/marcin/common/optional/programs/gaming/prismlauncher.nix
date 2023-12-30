{ pkgs, ... }:

{
  home.packages = with pkgs; [ prismlauncher-qt5 ];
}
