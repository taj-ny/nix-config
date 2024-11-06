{
  programs.plasma.configFile = {
    kdeglobals.KDE.widgetStyle.value = "Lightly";
    lightlyrc = {
      Common.CornerRadius.value = 8;
      Style = {
        DolphinSidebarOpacity.value = 50;
        MenuOpacity.value = 80;
        TabDrawHighlight.value = true;
      };
    };
  };
}