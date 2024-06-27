{ pkgs, ... }:

{
  home.packages = with pkgs; [ python311Packages.deemix ];
  modules.impermanence.persistentFiles = [ ".config/deemix/.arl" ];
}
