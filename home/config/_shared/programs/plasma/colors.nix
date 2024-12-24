{
  config,
  lib,
  ...
}:

let
  name = "ColorScheme";
  colors = lib.attrsets.mapAttrs (_: color: lib.colors.rgbToString color) config.colors;
in
{
  home.file.".local/share/color-schemes/${name}.colors".text = ''
    [ColorEffects:Disabled]
    Color=56,56,56
    ColorAmount=0
    ColorEffect=0
    ContrastAmount=0.65
    ContrastEffect=1
    IntensityAmount=0.1
    IntensityEffect=2

    [ColorEffects:Inactive]
    ChangeSelectionColor=false
    Color=112,111,110
    ColorAmount=0.025
    ColorEffect=2
    ContrastAmount=0.1
    ContrastEffect=2
    Enable=false
    IntensityAmount=0
    IntensityEffect=0

    [Colors:Button]
    BackgroundAlternate=${colors.backgroundLight1}
    BackgroundNormal=${colors.backgroundLight1}
    DecorationFocus=180,113,31
    DecorationHover=180,113,31
    ForegroundActive=180,113,31
    ForegroundInactive=189,195,199
    ForegroundLink=180,113,31
    ForegroundNegative=218,68,83
    ForegroundNeutral=246,116,0
    ForegroundNormal=247,247,247
    ForegroundPositive=255,162,0
    ForegroundVisited=132,67,101

    [Colors:Complementary]
    BackgroundAlternate=36,36,36
    BackgroundNormal=31,31,31
    DecorationFocus=255,162,0
    DecorationHover=255,162,0
    ForegroundActive=255,162,0
    ForegroundInactive=180,113,31
    ForegroundLink=180,113,31
    ForegroundNegative=83,62,37
    ForegroundNeutral=83,62,37
    ForegroundNormal=239,240,241
    ForegroundPositive=255,162,0
    ForegroundVisited=110,65,40

    [Colors:Selection]
    BackgroundAlternate=180,113,31
    BackgroundNormal=255,162,0
    DecorationFocus=180,113,31
    DecorationHover=180,113,31
    ForegroundActive=132,67,101
    ForegroundInactive=255,232,115
    ForegroundLink=44,27,0
    ForegroundNegative=200,62,76
    ForegroundNeutral=200,93,0
    ForegroundNormal=44,27,0
    ForegroundPositive=255,162,0
    ForegroundVisited=144,112,140

    [Colors:Tooltip]
    BackgroundAlternate=${colors.backgroundLight2}
    BackgroundNormal=${colors.backgroundLight2}
    DecorationFocus=180,113,31
    DecorationHover=180,113,31
    ForegroundActive=180,113,31
    ForegroundInactive=189,195,199
    ForegroundLink=180,113,31
    ForegroundNegative=218,68,83
    ForegroundNeutral=246,116,0
    ForegroundNormal=239,240,241
    ForegroundPositive=255,162,0
    ForegroundVisited=127,140,141

    [Colors:View]
    BackgroundAlternate=${colors.backgroundLight2}
    BackgroundNormal=${colors.backgroundLight1}
    DecorationFocus=255,162,0
    DecorationHover=255,162,0
    ForegroundActive=255,162,0
    ForegroundInactive=199,199,199
    ForegroundLink=255,162,0
    ForegroundNegative=218,68,83
    ForegroundNeutral=246,116,0
    ForegroundNormal=255,255,255
    ForegroundPositive=255,162,0
    ForegroundVisited=141,141,141

    [Colors:Window]
    BackgroundAlternate=${colors.backgroundLight1}
    BackgroundNormal=${colors.background}
    DecorationFocus=255,162,0
    DecorationHover=255,162,0
    ForegroundActive=83,62,37
    ForegroundInactive=189,195,199
    ForegroundLink=180,113,31
    ForegroundNegative=218,68,83
    ForegroundNeutral=246,116,0
    ForegroundNormal=255,255,255
    ForegroundPositive=255,162,0
    ForegroundVisited=110,65,40

    [General]
    ColorScheme=${name}
    Name=${name}
    shadeSortColumn=true

    [KDE]
    contrast=4

    [WM]
    activeBackground=25,25,25
    activeBlend=255,255,255
    activeForeground=239,240,241
    inactiveBackground=25,25,25
    inactiveBlend=65,65,65
    inactiveForeground=131,131,131
  '';
  programs.plasma = {
    configFile.kdeglobals.General = {
      AccentColor.value = colors.accent;
      ColorSchemeHash.value = "null";
    };
    workspace.colorScheme = name;
  };
}