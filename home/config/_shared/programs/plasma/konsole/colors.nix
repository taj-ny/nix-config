{
  config,
  lib,
  ...
}:

let
  colors = lib.attrsets.mapAttrs (_: color: lib.colors.rgbToString color) config.colors;
in
{
  home.file.".local/share/konsole/konsole.colorscheme".text = ''
    [Background]
    Color=31,31,31

    [BackgroundFaint]
    Color=36,36,36

    [BackgroundIntense]
    Color=0,0,0

    [Color0]
    Color=31,31,31

    [Color0Faint]
    Color=36,36,36

    [Color0Intense]
    Color=127,140,141

    [Color1]
    Color=${colors.redLight3}

    [Color1Faint]
    Color=${colors.redLight2}

    [Color1Intense]
    Color=${colors.redLight4}

    [Color2]
    Color=${colors.greenLight2}

    [Color2Faint]
    Color=${colors.greenLight1}

    [Color2Intense]
    Color=${colors.greenLight3}

    [Color3]
    Color=${colors.orangeLight5}

    [Color3Faint]
    Color=${colors.orangeLight4}

    [Color3Intense]
    Color=${colors.orangeLight6}

    [Color4]
    Color=${colors.blueLight5}

    [Color4Faint]
    Color=${colors.blueLight4}

    [Color4Intense]
    Color=${colors.blueLight6}

    [Color5]
    Color=${colors.purple}

    [Color5Faint]
    Color=${colors.purpleDark1}

    [Color5Intense]
    Color=${colors.purpleLight1}

    [Color6]
    Color=${colors.accent}

    [Color6Faint]
    Color=${colors.accentDark1}

    [Color6Intense]
    Color=${colors.accentLight1}

    [Color7]
    Color=252,252,252

    [Color7Faint]
    Color=99,104,109

    [Color7Intense]
    Color=255,255,255

    [Foreground]
    Color=252,252,252

    [ForegroundFaint]
    Color=239,240,241

    [ForegroundIntense]
    Color=255,255,255

    [General]
    Anchor=0.5,0.5
    Blur=true
    ColorRandomization=false
    Description=KritaDark
    FillStyle=Tile
    Opacity=0.75
    Wallpaper=
    WallpaperFlipType=NoFlip
    WallpaperOpacity=1
  '';
}