{ lib
, stdenv
, fetchurl
, fetchFromGitHub
, cmake
, extra-cmake-modules
, wrapQtAppsHook
, frameworkintegration
, kcmutils
, kdecoration
, kwindowsystem
, qt6
, qttools
}:

let
  config-tar-gz = fetchurl {
    url = "https://github.com/boehs/Lightly/files/14445309/config.tar.gz";
    hash = "sha256-eCIRm2z1+eTBcCCg8Wdt2DfTTbc767Rv+m1LI+t058I=";
  };

  lightlystyleconfig-json = fetchurl {
    url = "https://github.com/boehs/Lightly/files/14444935/lightlystyleconfig.json";
    hash = "sha256-ORQk0QirDB9dF3RdgmH5sstqQqqSEfOE6lh1YEUz+iM=";
  };
in
stdenv.mkDerivation rec {
  pname = "lightly-qt6";
  version = "0.4.1";

  src = fetchFromGitHub {
    owner = "boehs";
    repo = "Lightly";
    rev = "00ca23447844114d41bfc0d37cf8823202c082e8";
    hash = "sha256-NpgOcN9sDqgQMjqcfx92bfKohxaJpnwMgxb9MCu9uJM=";
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

  patchPhase = ''
    runHook prePatch

    mkdir tmp
    cd tmp
    tar -xv -f ${config-tar-gz}
    cd ..

    cp -v tmp/config/CMakeLists.txt kdecoration/config/CMakeLists.txt
    cp -v tmp/config/kcm_lightlydecoration.json kdecoration/config/kcm_lightlydecoration.json
    cp -v tmp/config/kcm_lightlydecoration.cpp kdecoration/config/kcm_lightlydecoration.cpp
    cp -v ${lightlystyleconfig-json} kstyle/config/lightlystyleconfig.json

    runHook postPatch
  '';

  meta = {
    description = "A modern style for qt applications";
    homepage = "https://github.com/boehs/lightly";
    license = lib.licenses.gpl2;
  };
}
