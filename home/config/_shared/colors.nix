{
  lib,
  ...
}:

let
  hues = {
    red = 0;
    orange = 30;
    yellow = 60;
    green = 120;
    aqua = 180;
    blue = 210;
    purple = 300;

    accent = 170;
  };
in
{
  colors =
    {
      background = [ 25 25 25 ];
      backgroundLight1 = [ 30 30 30 ];
      backgroundLight2 = [ 35 35 35 ];
      backgroundLight3 = [ 40 40 40 ];

      foreground = [ 255 255 255 ];
    } // (lib.colors.genPalette hues 0.85 0.6 0.05);
}