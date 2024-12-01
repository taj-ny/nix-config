rec {
  abs = x:
    if x >= 0 then
      x
    else
      -x;

  mod = x: y:
    x - y * builtins.floor (x / y);

  decToHex = x:
    let
      digits = "0123456789ABCDEF";
    in
      if x < 16 then "0" + builtins.substring x 1 digits
                else builtins.substring (x / 16) 1 digits + builtins.substring (mod x 16) 1 digits;

  round = x:
    let
      floored = builtins.floor x;
    in
    if (x - floored >= 0.5) then
      builtins.ceil x
    else
      floored;
}