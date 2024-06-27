{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.custom.programs.clementine;
in
{
  options.custom.programs.clementine.enable = mkEnableOption "Clementine";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ clementine ];
    custom.impermanence.persistentDirectories = [ ".config/Clementine" ];
  };
}
