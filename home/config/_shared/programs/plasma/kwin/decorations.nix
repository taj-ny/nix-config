{
  programs.plasma.configFile = {
    "klassy/klassyrc" = {
      "Windeco Exception 0" = {
        Enabled.value = true;
        ExceptionWindowPropertyPattern.value = ".*";
        ExceptionWindowPropertyType.value = 0;
        HideTitleBar.value = true;
      };
      # For some reason this outline makes KDE-Rounded-Corners' right/bottom primary outline not disappear when KWin
      # decides to place the window at half of a pixel.
      WindowOutlineStyle = {
        ThinWindowOutlineStyleInactive.value = "WindowOutlineAccentColor";
        ThinWindowOutlineThickness.value = 1;
        WindowOutlineAccentColorOpacityActive.value = 100;
        WindowOutlineAccentColorOpacityInactive.value = 100;
      };
    };
    kwinrc."org.kde.kdecoration2" = {
      library.value = "org.kde.klassy";
      theme.value = "Klassy";
    };
  };
}