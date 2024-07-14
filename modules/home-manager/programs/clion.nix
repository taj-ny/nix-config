{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.custom.programs.clion;
in
{
  options.custom.programs.clion.enable = mkEnableOption "JetBrains CLion";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      jetbrains.clion
      cmake
      gcc
    ];
  };
}
