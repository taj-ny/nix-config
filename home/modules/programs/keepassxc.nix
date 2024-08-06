{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.custom.programs.keepassxc;
in
{
  options.custom.programs.keepassxc.enable = mkEnableOption "KeepassXC";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ keepassxc ];

    custom.impermanence.persistentDirectories = [
      ".cache/keepassxc"
      ".config/keepassxc"
      "keepass"
    ];
  };
}
