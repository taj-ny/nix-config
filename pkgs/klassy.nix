{
  cmake,
  extra-cmake-modules,
  fetchFromGitHub,
  frameworkintegration,
  kcmutils,
  kdecoration,
  kirigami,
  qt6,
  qttools,
  stdenv,
  wrapQtAppsHook
}:

stdenv.mkDerivation rec {
  pname = "klassy";
  version = "6.2.breeze6.2.1";

  src = fetchFromGitHub {
    owner = "paulmcauley";
    repo = "klassy";
    rev = version;
    hash = "sha256-tFqze3xN1XECY74Gj0nScis7DVNOZO4wcfeA7mNZT5M=";
  };

  buildInputs = [
    frameworkintegration
    kcmutils
    kdecoration
    kirigami
    qt6.full
    qttools
  ];

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
    wrapQtAppsHook
  ];

  patchPhase = ''
    runHook prePatch

    substituteInPlace CMakeLists.txt \
      --replace 'set(PROJECT_VERSION "6.2.breeze6.2.1")' 'set(PROJECT_VERSION "6.2.1")'

    runHook postPatch
  '';

  cmakeFlags = [
    "-DCMAKE_INSTALL_PREFIX=$out"
    "-DCMAKE_BUILD_TYPE=Release"
    "-DBUILD_TESTING=OFF"
    "-DKDE_INSTALL_USE_QT_SYS_PATHS=ON"
    "-DBUILD_QT5=OFF"
  ];
}