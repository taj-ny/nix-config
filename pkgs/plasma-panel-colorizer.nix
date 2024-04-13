{ lib
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "plasma-panel-colorizer";
  version = "0.5.1";

  src = fetchFromGitHub {
    owner = "luisbocanegra";
    repo = "plasma-panel-colorizer";
    rev = "v${version}";
    hash = "sha256-B0MlnGbhBFSsX9Bc4uQvdvgMEifRGFOOLkgMAoCzWhE=";
  };

  installPhase = ''
    mkdir -p $out/share/plasma/plasmoids/luisbocanegra.panel.colorizer
    cp -r $src/package/* $out/share/plasma/plasmoids/luisbocanegra.panel.colorizer
  '';

  meta = {
    description = "Fully-featured widget to bring Latte-Dock and WM status bar customization features to the default Plasma panel";
    homepage = "https://github.com/luisbocanegra/plasma-panel-colorizer";
    license = lib.licenses.gpl3Plus;
  };
}
