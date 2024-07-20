{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.custom.programs.plasma.kwin;
in
{
  options.custom.programs.plasma.kwin = with types; {
    forceTransparency = {
      opacity = mkOption {
        default = 85;
        type = int;
      };

      windowClasses = mkOption {
        default = [ ];
        type = listOf str;
      };
    };

    tilingGap = mkOption {
      default = null;
      type = nullOr int;
    };
  };

  config = mkIf config.programs.plasma.enable {
    programs.plasma = {
      startup.startupScript.setTilingGap.text = mkIf (cfg.tilingGap != null) ''
        qdbus org.kde.KWin /Scripting org.kde.kwin.Scripting.loadScript ${pkgs.writeText "setTilingGap.js" ''
          for (const screen of workspace.screens) {
              workspace.tilingForScreen(screen.name).rootTile.padding = ${toString cfg.tilingGap};
          }
        ''}
        qdbus org.kde.KWin /Scripting org.kde.kwin.Scripting.start
      '';

      window-rules = optionals ((length cfg.forceTransparency.windowClasses) > 0) [
        {
          description = "Force transpaceny";
          match = {
            window-class = {
              type = "regex";
              value = strings.concatStringsSep "|" cfg.forceTransparency.windowClasses;
            };
          };

          apply = {
            opacityactive = {
              apply = "force";
              value = cfg.forceTransparency.opacity;
            };

            opacityinactive = {
              apply = "force";
              value = cfg.forceTransparency.opacity;
            };
          };
        }
      ];
    };
  };
}
