{ pkgs, ... }:

{
  home.packages = with pkgs; [ clementine ];
  modules.impermanence.persistentDirectories = [ ".config/Clementine" ];
}
