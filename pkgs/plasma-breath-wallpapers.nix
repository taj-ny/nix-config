{ lib
, stdenv
, fetchgit
, imagemagick
}:

stdenv.mkDerivation rec {
  pname = "plasma-breath-wallpapers";
  version = "1.0.0";

  src = fetchgit {
    url = "https://gitlab.manjaro.org/artwork/themes/breath.git";
    rev = "321ed779885f67187801beb0480890f9b8a87a95";
    hash = "sha256-ExE0OsGBV1ERD0KOkOdNmeNE+uh7+GTtybneTDupOsk=";
  };

  nativeBuildInputs = [ imagemagick ];

  installPhase = ''
    dir=$(pwd)
    cd wallpapers/Bamboo/contents/images
    mv 5120x2880.png tmp.png
    convert tmp.png -brightness-contrast -20x30 5120x2880.png
    convert 5120x2880.png -resize 1920x1080 -blur 0x12 1920x1080_blurred.png
    rm tmp.png
    cd $dir

    mkdir -p $out/share/wallpapers
    cp -r wallpapers/* $out/share/wallpapers
  '';

  meta = {
    description = "Wallpapers from the Breath theme";
    homepage = "https://gitlab.manjaro.org/artwork/themes/breath";
    license = lib.licenses.cc-by-sa-40;
  };
}
