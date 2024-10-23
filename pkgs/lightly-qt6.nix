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

stdenv.mkDerivation rec {
  pname = "lightly-qt6";
  version = "0.5.4";

  src = fetchFromGitHub {
    owner = "Bali10050";
    repo = "Lightly";
    rev = "v${version}";
    hash = "sha256-h0VCxee0PgMAQerfjIZqRA944Iz6VSGvGAv6AoOtvBM=";
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
