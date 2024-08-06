{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.custom.programs.firefox;
in
{
  options.custom.programs.firefox.enable = mkEnableOption "Firefox";

  config = mkIf cfg.enable {
    programs.firefox.enable = true;
    custom.impermanence.persistentDirectories = [ ".mozilla/firefox" ];
  };
}
