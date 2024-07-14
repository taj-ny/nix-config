{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.custom.programs.rider;
in
{
  options.custom.programs.rider.enable = mkEnableOption "JetBrains Rider";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      jetbrains.rider
      (patchDesktop jetbrains.rider "rider" "^Exec=rider" "Exec=steam-run rider")
    ];
  };
}
