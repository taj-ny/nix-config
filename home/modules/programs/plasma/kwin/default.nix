{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.custom.programs.plasma.kwin;
in
{
  options.custom.programs.plasma.kwin = with types; {
    forceTransparency = {
      opacity = mkOptionSimpleDefault int 85;
      windowClasses = mkOptionSimpleDefault (listOf str) [ ];
    };
    reconfigure.effects = mkOptionSimpleDefault (listOf str) [ ];
  };

  config = mkIf config.programs.plasma.enable {
    home.activation.configure-kwin = hm.dag.entryAfter [ "configure-plasma" ] (
      let
        qdbus = "${pkgs.kdePackages.qttools}/bin/qdbus";
      in
      ''
        if ${qdbus} org.kde.KWin; then
          ${qdbus} org.kde.KWin /KWin org.kde.KWin.reconfigure
          ${strings.concatStringsSep "\n"
          (map (effect: "${qdbus} org.kde.KWin /Effects org.kde.kwin.Effects.reconfigureEffect ${effect}") cfg.reconfigure.effects)
          }
        fi
      '');
    programs.plasma.window-rules = optionals ((length cfg.forceTransparency.windowClasses) > 0) [
      {
        description = "Force transparency";
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
        match = {
          window-class = {
            type = "regex";
            value = strings.concatStringsSep "|" cfg.forceTransparency.windowClasses;
          };
          window-types = [
            "dialog"
            "normal"
            "toolbar"
            "torn-of-menu"
            "utility"
          ];
        };
      }
    ];
  };
}
