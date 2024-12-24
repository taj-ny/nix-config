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
    Color=${colors.background}

    [BackgroundFaint]
    Color=${colors.backgroundLight1}

    [BackgroundIntense]
    Color=0,0,0

    [Color0]
    Color=${colors.background}

    [Color0Faint]
    Color=${colors.backgroundLight1}

    [Color0Intense]
    Color=127,140,141

    [Color1]
    Color=${colors.red}

    [Color1Faint]
    Color=${colors.redDark1}

    [Color1Intense]
    Color=${colors.redLight1}

    [Color2]
    Color=${colors.green}

    [Color2Faint]
    Color=${colors.greenDark1}

    [Color2Intense]
    Color=${colors.greenLight1}

    [Color3]
    Color=${colors.orange}

    [Color3Faint]
    Color=${colors.orangeDark1}

    [Color3Intense]
    Color=${colors.orangeLight1}

    [Color4]
    Color=${colors.blue}

    [Color4Faint]
    Color=${colors.blueDark1}

    [Color4Intense]
    Color=${colors.blueLight1}

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
    Opacity=0.85
    Wallpaper=
    WallpaperFlipType=NoFlip
    WallpaperOpacity=1
  '';
}