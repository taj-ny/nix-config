{
  lib,
  pkgs,
  ...
}:

{
  imports = lib.allExceptThisDefault ./.;

  custom.programs.plasma.kwin = {
    cornerRadius = 15;
    forceTransparency = {
      opacity = 90;
      windowClasses = [
        "ark"
        "clementine"
        "dolphin"
        "keepassxc"
        "ksshaskpass"
        "kwrite"
        "filelight"
        "org.freedesktop.impl.portal.desktop.kde"
        "org.kde.ksshaskpass"
        "org.nicotine_plus.Nicotine"
        "plasmashell"
        "prismlauncher"
        "qalculate-qt"
        "systemsettings"
        "vscodium"
      ];
    };
    reconfigure.effects = [
      "forceblur"
      "kwin4_effect_geometry_change"
      "kwin4_effect_shapecorners"
    ];
  };
  home.packages = [ pkgs.kwin-effects-geometry-change ];
  programs.plasma = {
    configFile.kwinrc = {
      Effect-overview.BorderActivate.value = 9;
      ModifierOnlyShortcuts.Meta.value = "";
      Plugins = {
        contrastEnabled.value = false;
        kwin4_effect_geometry_changeEnabled.value = true;
        shakecursorEnabled.value = false;
        slideEnabled.value = false;
        startupfeedbackEnabled.value = false;
        startupfeedback_busy_cursorEnabled.value = true;
      };
      Wayland.EnablePrimarySelection.value = false;
      Windows = {
        DelayFocusInterval.value = 0;
        FocusPolicy.value = "FocusFollowsMouse";
      };
      Xwayland.XwaylandEavesdrops.value = "None";
    };
    kwin.virtualDesktops.number = 10;
    window-rules = [
      {
        description = "Minimum size";
        apply.minsize = {
          apply = "force";
          value = "0,0";
        };
        match.window-types = [ "normal" "dialog" ];
      }
    ];
  };
}