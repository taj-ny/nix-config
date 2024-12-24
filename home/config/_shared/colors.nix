{
  lib,
  ...
}:

let
  s = 0.75;
  base = {
    red = [ 0 s 0.75 ];
    orange = [ 30 s 0.85 ];
    green = [ 120 (s - 0.15) 0.7 ];
    blue = [ 210 s 0.85 ];
    purple = [ 300 s 0.6 ];

    accent = [ 170 s 0.6 ];
  };
in
{
  colors = {
    background = [ 20 20 20 ];
    backgroundLight1 = [ 25 25 25 ];
    backgroundLight2 = [ 30 30 30 ];
    backgroundLight3 = [ 35 35 35 ];

    foreground = [ 255 255 255 ];
  } // (lib.colors.genPalette base 0.0725);
}