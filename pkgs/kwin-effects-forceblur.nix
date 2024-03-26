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
  pname = "kwin-effects-forceblur";
  version = "1.1.2";

  src = fetchFromGitHub {
    owner = "taj-ny";
    repo = "kwin-forceblur";
    rev = "v${version}";
    hash = "sha256-/5vyC9ISJKHxDzqrTjaN7T7cc8FbF/P/JmQyeyHm++8=";
  };

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
    wrapQtAppsHook
  ];

  buildInputs = [
    kwin
    qttools
  ];

  meta = with lib; {
    description = "A fork of the KWin Blur effect for KDE Plasma 6 with the ability to blur any window on Wayland and X11";
    license = licenses.gpl3;
    homepage = "https://github.com/taj-ny/kwin-effects-forceblur";
  };
}
