{
  ...
}:

{
  programs.plasma.panels = [
    {
      height = 29;
      location = "top";
      floating = false;
      widgets = [
        {
          kickoff.icon = "nix-snowflake"; # Used only for the icon, it's better than media frame
        }
        {
          name = "org.kde.windowtitle";
          config.General = {
            capitalFont = false;
            filterActivityInfo = false;
            useActivityIcon = false;
          };
        }
        "org.kde.plasma.appmenu"
        "org.kde.plasma.panelspacer"
        {
          systemTray.items = {
            hidden = [
              "Clementine"
              "org.kde.plasma.brightness"
              "org.kde.plasma.cameraindicator"
              "org.kde.kscreen"
              "org.kde.kdeconnect"
              "org.kde.plasma.keyboardlayout"
              "org.kde.plasma.keyboardindicator"
              "org.kde.plasma.manage-inputmethod"
              "org.kde.plasma.mediacontroller"
              "vmware-tray"
              "Yakuake"
            ];
            shown = [
              "org.kde.plasma.battery"
              "org.kde.plasma.volume"
              "org.kde.plasma.notifications"
              "org.kde.plasma.networkmanagement"
            ];
          };
        }
        {
          digitalClock = {
            date.enable = false;
            time.showSeconds = "always";
          };
        }
        {
          name = "luisbocanegra.panel.colorizer";
          config.General = {
            colorMode = "1";
            colorModeTheme = "9";
            enableCustomPadding = "true";
            fgColorMode = "1";
            fgContrastFixEnabled = "false";
            fgLightness = "0.55";
            hideWidget = "true";
            marginRules = "org.kde.plasma.kickoff,1,0|org.kde.windowtitle,1,0|plasmusic-toolbar,0,-15";
            panelPadding = "16";
            panelRealBgOpacity = "0.5";
            panelSpacing = "10";
            radius = "7";
            widgetBgEnabled = "false";
            widgetBgVMargin = "3";
          };
        }
      ];
    }
  ];
}
