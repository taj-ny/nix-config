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
  version = "0.6.1";

  src = fetchFromGitHub {
    owner = "matinlotfali";
    repo = "KDE-Rounded-Corners";
    rev = "v${version}";
    hash = "sha256-8QkuIuHC0/fMxh8K3/I8GNhNPX+tw7kUMiU2oK12c0U=";
  };

  patches = [ ./disable-effect-when-fullscreen.patch ];

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
