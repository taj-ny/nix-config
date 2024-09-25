{
  cmake,
  extra-cmake-modules,
  fetchFromGitHub,
  frameworkintegration,
  kcmutils,
  kdecoration,
  kwindowsystem,
  lib,
  stdenv,
  qt6,
  qttools,
  wrapQtAppsHook
}:

stdenv.mkDerivation {
  pname = "lightly-qt6";
  version = "2024-09-21";

  src = fetchFromGitHub {
    owner = "Bali10050";
    repo = "Lightly";
    rev = "c27211515fc72752a818a1dab9377a4a9dd3815e";
    hash = "sha256-XKadGPn2y7lu+8I58loi/BJZcJNmCUy5/uuoTXUYa9s=";
  };

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
    wrapQtAppsHook
  ];

  buildInputs = [
    frameworkintegration
    kcmutils
    kdecoration
    kwindowsystem
    qt6.full
    qttools
  ];

  cmakeFlags = [
    "-DWITH_DECORATIONS=OFF"
  ];

  meta = {
    description = "A modern style for qt applications";
    homepage = "https://github.com/Bali10050/Lightly";
    license = lib.licenses.gpl2;
  };
}
