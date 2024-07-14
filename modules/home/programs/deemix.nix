{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.custom.programs.deemix;
in
{
  options.custom.programs.deemix.enable = mkEnableOption "deemix";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ python311Packages.deemix ];
    custom.impermanence.persistentFiles = [ ".config/deemix/.arl" ];
  };
}
