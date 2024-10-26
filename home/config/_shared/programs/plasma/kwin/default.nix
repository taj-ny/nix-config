{
  lib,
  ...
}:

{
  imports = lib.allExceptThisDefault ./.;

  custom.programs.plasma.kwin = {
    cornerRadius = 15;
    forceTransparency = {
      opacity = 85;
      windowClasses = [
        "ark"
        "clementine"
        "dolphin"
        "keepassxc"
        "ksshaskpass"
        "kwrite"
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
  programs.plasma = {
    configFile.kwinrc = {
      Effect-overview.BorderActivate.value = 9;
      ModifierOnlyShortcuts.Meta.value = "";
      Plugins = {
        contrastEnabled.value = false;
        kwin4_effect_geometry_changeEnabled.value = true;
        kwin_effect_lightlyshadersEnabled.value = false;
        lightlyshaders_blurEnabled.value = false;
        shakecursorEnabled.value = false;
        slideEnabled.value = false;
        startupfeedbackEnabled.value = false;
        startupfeedback_busy_cursorEnabled.value = true;
      };
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