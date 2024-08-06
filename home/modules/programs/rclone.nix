{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.custom.programs.rclone;
in
{
  options.custom.programs.rclone.enable = mkEnableOption "rclone";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ rclone ];
    custom.impermanence.persistentFiles = [ ".config/rclone/rclone.conf" ];
  };
}
