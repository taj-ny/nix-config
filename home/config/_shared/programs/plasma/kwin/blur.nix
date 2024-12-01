{
  config,
  lib,
  ...
}:

let
  forceBlur = [
    "konsole"
    "yakuake"
  ];
in
{
  custom.programs.plasma.kwin.reconfigure.effects = [ "forceblur" ];
  programs.plasma.configFile.kwinbetterblurrc = {
    "WindowRules/Global/Properties" = {
      BlurStrength.value = 9;
      CornerAntialiasing.value = 1;
      WindowOpacityAffectsBlur.value = false;
    };

    "WindowRules/ForceBlur/Conditions/0" = {
      WindowClass.value =
        (forceBlur ++ config.custom.programs.plasma.kwin.forceTransparency.windowClasses)
        |> lib.strings.concatStringsSep "|"
        |> builtins.replaceStrings [ "." ] [ "\\." ];
      WindowType.value = "Dialog Normal Menu Toolbar Tooltip Utility";
    };
    "WindowRules/ForceBlur/Conditions/1" = {
      Negate.value = "WindowType";
      WindowClass.value = "firefox";
      WindowType.value = "Menu";
    };
    "WindowRules/ForceBlur/Properties" = {
      BlurContent.value = true;
      BlurDecorations.value = true;
    };

    "WindowRules/StaticBlur/Conditions/0".HasWindowBehind.value = false;
    "WindowRules/StaticBlur/Properties".StaticBlur.value = true;

    "WindowRules/LowBlurStrength".Priority.value = 1;
    "WindowRules/LowBlurStrength/Conditions/0".HasWindowBehind.value = true;
    "WindowRules/LowBlurStrength/Properties".BlurStrength.value = 3;

    "WindowRules/WindowCorners/Conditions/0" = {
      Negate.value = "WindowState";
      WindowState.value = "Fullscreen Maximized";
      WindowType.value = "Normal";
    };
    "WindowRules/WindowCorners/Properties".CornerRadius.value = config.custom.programs.plasma.kwin.cornerRadius + 2;

    "WindowRules/MenuCorners/Conditions/0".WindowType.value = "Menu";
    "WindowRules/MenuCorners/Properties".CornerRadius.value = 10;
  };

  programs.plasma.configFile.kwinrc = {
    Effect-blurplus.ConvertSimpleConfigToRules.value = false;
    Plugins = {
      blurEnabled.value = false;
      forceblurEnabled.value = true;
    };
  };
}