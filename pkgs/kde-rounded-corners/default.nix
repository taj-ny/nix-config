{ lib
, stdenv
, cmake
, extra-cmake-modules
, kwin
, wrapQtAppsHook
, qttools
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "kde-rounded-corners";
  version = "0.6.5";

  src = fetchFromGitHub {
    owner = "matinlotfali";
    repo = "KDE-Rounded-Corners";
    rev = "v${version}";
    hash = "sha256-g7gNFv4/ighfxYz/VXF5KvcoT6t4lT5soDLlV3oAKvc=";
  };

  patches = [ 
    ./dont-paint-area-behind-windows.patch
    ./fix-outline-on-some-transparent-windows.patch
    ./force-full-outline-opacity.patch 
  ];

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
    wrapQtAppsHook
  ];

  buildInputs = [
    kwin
    qttools
  ];

  meta = {
    description = "Rounds the corners of your windows in KDE Plasma 5 and 6";
    homepage = "https://github.com/matinlotfali/KDE-Rounded-Corners";
    licenses = lib.licenses.gpl3Plus;
  };
}
