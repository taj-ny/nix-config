{
  buildNpmPackage,
  fetchFromGitHub,
  kdePackages,
  lib,
  typescript
}:

buildNpmPackage rec {
  pname = "krohnkite";
  version = "0.9.8.3";

  src = fetchFromGitHub {
    owner = "anametologin";
    repo = "krohnkite";
    rev = version;
    hash = "sha256-PiGpYOKvBpwkPfDWHlOhq7dwyBYzfzfJVURiEC1a78g=";
  };

  nativeBuildInputs = with kdePackages; [
    kpackage
    typescript
  ];

  buildInputs = with kdePackages; [ kwin ];

  dontWrapQtApps = true;

  npmDepsHash = "sha256-IUGRxDCn/aEebCgDPElEPKOxfoYmLoFHVROkTJpNISY=";

  dontNpmBuild = true;

  patchPhase = ''
    runHook prePatch

    substituteInPlace Makefile \
      --replace "npm install --save-dev" "" \
      --replace "npm run tsc --" "tsc"

    runHook postPatch
  '';

  installPhase = ''
    runHook preInstall

    kpackagetool6 -i pkg --packageroot $out/share/kwin/scripts

    runHook postInstall
  '';

  meta = with lib; {
    description = "Dynamic tiling extension for KWin";
    license = licenses.mit;
  };
}