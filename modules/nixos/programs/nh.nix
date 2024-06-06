{ config, lib, ... }:

with lib;
let
  cfg = config.modules.programs.nh;
in
{
  options.modules.programs.nh.enable = mkEnableOption "nh";

  config.programs.nh = mkIf cfg.enable {
    enable = true;
    flake = "/nix/config";
  };
}
