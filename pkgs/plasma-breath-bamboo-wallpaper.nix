{ lib
, stdenv
, fetchgit
, imagemagick
}:

stdenv.mkDerivation rec {
  pname = "plasma-breath-bamboo-wallpaper";
  version = "1.0.0";

  src = fetchgit {
    url = "https://gitlab.manjaro.org/artwork/themes/breath.git";
    rev = "321ed779885f67187801beb0480890f9b8a87a95";
    hash = "sha256-ExE0OsGBV1ERD0KOkOdNmeNE+uh7+GTtybneTDupOsk=";
  };

  nativeBuildInputs = [ imagemagick ];

  buildPhase = ''
    runHook preBuild

    ROOT=$(pwd)
    cd wallpapers/Bamboo/contents/images
    mv 5120x2880.png tmp.png
    magick tmp.png -gamma 0.5 -brightness-contrast 0x10 5120x2880.png
    rm tmp.png
    cd $ROOT

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/wallpapers
    cp -r wallpapers/Bamboo $out/share/wallpapers

    runHook postInstall
  '';

  meta = {
    description = "Bamboo wallpaper from the Breath theme";
    homepage = "https://gitlab.manjaro.org/artwork/themes/breath";
    license = lib.licenses.cc-by-sa-40;
  };
}