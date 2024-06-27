{ lib
, stdenv
, fetchFromGitHub
, cmake
, extra-cmake-modules
, plasma5support
}:

stdenv.mkDerivation rec {
  pname = "plasma-panel-colorizer";
  version = "0.5.2";

  src = fetchFromGitHub {
    owner = "luisbocanegra";
    repo = "plasma-panel-colorizer";
    rev = "v${version}";
    hash = "sha256-+JweNB+zjbXh6Htyvu2vgogAr5Fl5wDPCpm6GV18NJ0=";
  };

  dontWrapQtApps = true;

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
  ];

  buildInputs = [
    plasma5support
  ];

  meta = {
    description = "Fully-featured widget to bring Latte-Dock and WM status bar customization features to the default Plasma panel";
    homepage = "https://github.com/luisbocanegra/plasma-panel-colorizer";
    license = lib.licenses.gpl3Plus;
  };
}
