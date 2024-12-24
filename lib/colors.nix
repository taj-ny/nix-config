{
  lib
}:

let
  math = import ./math.nix;
in
rec {
  genPalette = base: valueDelta:
    (lib.concatMapAttrs
      (name: hsv:
        let
          h = builtins.elemAt hsv 0;
          s = builtins.elemAt hsv 1;
          v = builtins.elemAt hsv 2;
        in
          {
            "${name}" = [ h s v ];
            "${name}Dark1" = [ h s (v - valueDelta) ];
            "${name}Dark2" = [ h s (v - valueDelta * 2) ];
            "${name}Dark3" = [ h s (v - valueDelta * 3) ];
            "${name}Light1" = [ h s (v + valueDelta) ];
            "${name}Light2" = [ h s (v + valueDelta * 2) ];
          })
      base)
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

  rgbToHex = rgb:
    "${math.decToHex (builtins.elemAt rgb 0)}${math.decToHex (builtins.elemAt rgb 1)}${math.decToHex (builtins.elemAt rgb 2)}";
  rgbToString = rgb:
    lib.concatMapStringsSep "," (x: toString x) rgb;

}