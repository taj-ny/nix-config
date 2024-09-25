{
  buildNpmPackage,
  fetchFromGitHub,
  kdePackages,
  lib,
  typescript
}:

buildNpmPackage {
  pname = "krohnkite";
  version = "2024-09-22";

  src = fetchFromGitHub {
    owner = "anametologin";
    repo = "krohnkite";
    rev = "aa4d21cc924422001bc1a5c7f5cd66623cf9cef4";
    hash = "sha256-k4BXG/TQevqX2Fd7jmOkKAfyNje/O3ETqKe2o4WHcao=";
  };

  nativeBuildInputs = with kdePackages; [
    kpackage
    typescript
  ];

  buildInputs = with kdePackages; [ kwin ];

  dontWrapQtApps = true;

  npmDepsHash = "sha256-HHrYHxksfhODKPhHeG4mMEQkhyOVAg8dLvY0GHfre/U=";

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