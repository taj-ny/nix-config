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
  pname = "lightlyshaders";
  version = "1.0.1";

  src = fetchFromGitHub {
    owner = "a-parhom";
    repo = "LightlyShaders";
    rev = "a380ae644caa874d79626bccc5674c7e653b99fe";
    hash = "sha256-QiB6nhPz/eckKP7+bbCARGiWxMjLqTp0wYaT1GggesU=";
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
}
