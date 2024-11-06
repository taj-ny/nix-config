{
  config,
  lib,
  ...
}:

let
  forceBlur = [
    "firefox"
    "konsole"
    "yakuake"
  ];
in
{
  custom.programs.plasma.kwin.reconfigure.effects = [ "forceblur" ];
  programs.plasma.configFile.kwinrc = {
    Effect-blurplus =
      let
        cornerRadius = config.custom.programs.plasma.kwin.cornerRadius + 2;
      in
      {
        BlurStrength.value = 9;
        BlurMenus.value = true;
        NoiseStrength.value = 5;
        FakeBlur.value = true;
        FakeBlurImageSourceDesktopWallpaper.value = true;
        WindowClasses.value = lib.strings.concatStringsSep "\n" (forceBlur ++ config.custom.programs.plasma.kwin.forceTransparency.windowClasses);
        BlurDecorations.value = true;
        PaintAsTranslucent.value = true;
        TransparentBlur.value = false;
        TopCornerRadius.value = cornerRadius + 2;
        BottomCornerRadius.value = cornerRadius + 2;
        MenuCornerRadius.value = 10;
      };
    Plugins = {
      blurEnabled.value = false;
      forceblurEnabled.value = true;
    };
  };
}