{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.modules.services.mysql;
in
{
  options.modules.services.mysql.enable = mkEnableOption "MySQL";

  config.services.mysql = mkIf cfg.enable {
    enable = true;
    package = pkgs.mariadb;
  };
}
