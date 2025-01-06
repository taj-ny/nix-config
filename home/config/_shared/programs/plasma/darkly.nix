{
  programs.plasma.configFile = {
    darklyrc = {
      Common.CornerRadius.value = 8;
      Style = {
        AdjustToDarkThemes.value = true;
        DolphinSidebarOpacity.value = 50;
        MenuOpacity.value = 80;
        TabBGColor.value = "0,0,0,50";
        TabUseHighlightColor.value = true;
      };
    };
    kdeglobals.KDE.widgetStyle.value = "Darkly";
  };
}