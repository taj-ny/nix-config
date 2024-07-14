{ config, lib, ... }:

with lib;
let 
  cfg = config.custom.impermanence;
in
{
  options.custom.impermanence = with types; {
    enable = mkEnableOption "home impermanence";

    persistentDirectories = mkOption {
      default = [];
      type = listOf anything;
    };

    persistentFiles = mkOption {
      default = [];
      type = listOf anything;
    };
  };

  config.home.persistence."/nix/persist/home/${config.home.username}" = mkIf cfg.enable {
    allowOther = true;
    directories = cfg.persistentDirectories;
    files = cfg.persistentFiles;
  };
}
