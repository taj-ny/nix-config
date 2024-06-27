{ pkgs, ... }:

{
  home.packages = with pkgs; [ nicotine-plus ];
  modules.impermanence.persistentDirectories = [ "./local/share/nicotine" ];
}
