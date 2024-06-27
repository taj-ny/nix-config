{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.custom.programs.nicotine-plus;
in
{
  options.custom.programs.nicotine-plus.enable = mkEnableOption "Nicotine+";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ nicotine-plus ];

    custom.impermanence.persistentDirectories = [ 
      ".config/nicotine"
      ".local/share/nicotine"
    ];
  };
}
