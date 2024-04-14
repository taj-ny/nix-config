{ lib
, stdenv
, fetchgit
}:

stdenv.mkDerivation rec {
  pname = "plasma-breath-wallpapers";
  version = "1.0.0";

  src = fetchgit {
    url = "https://gitlab.manjaro.org/artwork/themes/breath.git";
    rev = "321ed779885f67187801beb0480890f9b8a87a95";
    hash = "sha256-ExE0OsGBV1ERD0KOkOdNmeNE+uh7+GTtybneTDupOsk=";
  };

  installPhase = ''
    mkdir -p $out/share/wallpapers
    cp -r $src/wallpapers/* $out/share/wallpapers
  '';

  meta = {
    description = "Wallpapers from the Breath theme";
    homepage = "https://gitlab.manjaro.org/artwork/themes/breath";
    license = lib.licenses.cc-by-sa-40;
  };
}
