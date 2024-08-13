{
  fetchurl,
  imagemagick,
  librsvg,
  stdenv,
  rascii
}:

let
  rev = "e3a74d1c40086393f2b1b9f218497da2db0ff3ae";

  # Cloning the nixos-artwork repository is extremely slow
  nix-snowflake = fetchurl {
    url = "https://raw.githubusercontent.com/NixOS/nixos-artwork/${rev}/logo/nix-snowflake.svg";
    hash = "sha256-SCuQlSPB14GFTq4XvExJ0QEuK2VIbrd5YYKHLRG/q5I=";
  };
  nixos = fetchurl {
    url = "https://raw.githubusercontent.com/NixOS/nixos-artwork/${rev}/logo/nixos.svg";
    hash = "sha256-E+qpO9SSN44xG5qMEZxBAvO/COPygmn8r50HhgCRDSw=";
  };
in
stdenv.mkDerivation {
  pname = "nix-ascii-art";
  version = "1.0.0";

  nativeBuildInputs = [ imagemagick librsvg rascii ];

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out

    rsvg-convert -w 64 -h 64 ${nix-snowflake} -o nix-snowflake.png
    rascii -w 32 -H 16 -c nix-snowflake.png | tee $out/nix-snowflake-32x16.txt
    rascii -w 64 -H 32 -c nix-snowflake.png | tee $out/nix-snowflake-64x32.txt

    rsvg-convert -w 319 -h 100 ${nixos} -o nixos.png
    convert nixos.png -channel RGB -region +125 -negate -fx 'a==0 ? 0 : u' nixos-inverted.png # Invert text
    rascii -w 106 -H 16 -c nixos-inverted.png | tee $out/nixos-106x16.txt

    echo "" >> $out/nix-snowflake-32x16.txt
    echo "" >> $out/nix-snowflake-64x32.txt
    echo "" >> $out/nixos-106x16.txt
  '';
}
