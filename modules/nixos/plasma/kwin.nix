{ config, inputs, lib, pkgs, ... }:

with lib;
let
  cfg = config.modules.plasma.kwin;
in
{
  options.modules.plasma.kwin = with types; {
    ams = mkOption {
      default = true;
      type = bool;
    };

    cursorType = mkOption {
      default = "hardware";
      type = enum [ "hardware" "software" ];
    };

    effects = {
      forceBlur.enable = mkEnableOption "Force Blur";
      geometryChange.enable = mkEnableOption "Geometry Change";
      roundedCorners.enable = mkEnableOption "KDE Rounded Corners";
    };
  };

  config = {
    environment = {
      systemPackages = with pkgs;
        (optional cfg.effects.forceBlur.enable inputs.kwin-effects-forceblur.packages.${pkgs.system}.default)
        ++ (optional cfg.effects.geometryChange.enable kwin-effects-geometry-change)
        ++ (optional cfg.effects.roundedCorners.enable kde-rounded-corners);

      variables = {
        KWIN_DRM_NO_AMS = mkIf (!cfg.ams) "1";
        KWIN_FORCE_SW_CURSOR = mkIf (cfg.cursorType == "hardware") "0";
      };
    };
  };
}
