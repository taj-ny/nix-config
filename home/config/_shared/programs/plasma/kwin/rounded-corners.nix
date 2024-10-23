{
  config,
  ...
}:

{
  programs.plasma.configFile.kwinrc = {
    MaximizeTile = {
      DisableOutlineTile.value = false;
      DisableRoundTile.value = false;
    };
    Plugins.kwin4_effect_shapecornersEnabled.value = true;
    PrimaryOutline = {
      ActiveOutlineUseCustom.value = false;
      ActiveOutlineUsePalette.value = true;
      InactiveOutlineAlpha.value = 200;
      InactiveOutlineUseCustom.value = false;
      InactiveOutlineUsePalette.value = true;
    };
    Round-Corners = {
      AnimationEnabled.value = false;
      InactiveCornerRadius.value = config.custom.programs.plasma.kwin.cornerRadius;
      InactiveShadowSize.value = 40;
      ShadowSize.value = 40;
      Size.value = config.custom.programs.plasma.kwin.cornerRadius;
    };
    SecondOutline = {
      InactiveSecondOutlineThickness.value = 0;
      SecondOutlineThickness.value = 0;
    };
  };
}