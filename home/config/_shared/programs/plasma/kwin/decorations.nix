{
  programs.plasma.configFile = {
    darklyrc = {
      Common = {
        ShadowSize.value = "ShadowMedium";
        ShadowStrength.value = 255;
      };
      "Windeco Exception 0" = {
        Enabled.value = true;
        ExceptionType.value = 0;
        ExceptionPattern.value = ".*";
        HideTitleBar.value = true;
      };
    };
    kwinrc."org.kde.kdecoration2" = {
      library.value = "org.kde.darkly";
      theme.value = "Darkly";
    };
  };
}