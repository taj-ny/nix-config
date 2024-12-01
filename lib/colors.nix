{
  lib
}:

let
  math = import ./math.nix;
in
rec {
  genPalette = hues: saturation: value: valueDelta:
    (lib.concatMapAttrs
      (name: hue: {
        "${name}" = [ hue saturation value ];
        "${name}Dark1" = [ hue saturation (value - valueDelta) ];
        "${name}Dark2" = [ hue saturation (value - valueDelta * 2) ];
        "${name}Dark3" = [ hue saturation (value - valueDelta * 3) ];
        "${name}Light1" = [ hue saturation (value + valueDelta) ];
        "${name}Light2" = [ hue saturation (value + valueDelta * 2) ];
        "${name}Light3" = [ hue saturation (value + valueDelta * 3) ];
        "${name}Light4" = [ hue saturation (value + valueDelta * 4) ];
        "${name}Light5" = [ hue saturation (value + valueDelta * 5) ];
        "${name}Light6" = [ hue saturation (value + valueDelta * 6) ];
      })
      hues)
    |> lib.mapAttrs (_: value:
      hsvToRgb (builtins.elemAt value 0) (builtins.elemAt value 1) (builtins.elemAt value 2)
    );

  # https://github.com/Inseckto/HSV-to-RGB/blob/bfbc74026b0a9cb367b05570cdb23b1d03d18dc7/HSV2RGB.c
  hsvToRgb = h: s: v:
    let
      h' = h / 360.0;

      i = builtins.floor(h' * 6);
      f = h' * 6 - i;
      p = v * (1 - s);
      q = v * (1 - f * s);
      t = v * (1 - (1 - f) * s);
    in
      (builtins.elemAt
      [
        [ v t p ]
        [ q v p ]
        [ p v t ]
        [ p q v ]
        [ t p v ]
        [ v p q ]
      ]
      (math.mod i 6))
      |> builtins.map (x: math.round(x * 255));




    # let
    #   c = v * s;
    #   x = c * (1 - (math.abs (math.mod (h / 60.0) 2) - 1));
    #   m = v - c;
    #   rgb' = if h < 60 then { r = c; g = x; b = 0; }
    #         else if h < 120 then { r = x; g = c; b = 0; }
    #         else if h < 180 then { r = 0; g = c; b = x; }
    #         else if h < 240 then { r = 0; g = x; b = c; }
    #         else if h < 300 then { r = x; g = 0; b = c; }
    #         else { r = c; g = 0; b = x; };
    # in
    #   [
    #     (math.round ((rgb'.r + m) * 255))
    #     (math.round ((rgb'.g + m) * 255))
    #     (math.round ((rgb'.b + m) * 255))
    #   ];

  rgbToHex = rgb:
    "${math.decToHex (builtins.elemAt rgb 0)}${math.decToHex (builtins.elemAt rgb 1)}${math.decToHex (builtins.elemAt rgb 2)}";
  rgbToString = rgb:
    lib.concatMapStringsSep "," (x: toString x) rgb;

}