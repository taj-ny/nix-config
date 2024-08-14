{
  buildNpmPackage,
  fetchFromGitHub,
  kdePackages,
  lib,
  typescript
}:

buildNpmPackage {
  pname = "krohnkite";
  version = "2024-08-14";

  src = fetchFromGitHub {
    owner = "anametologin";
    repo = "krohnkite";
    rev = "1de17a204248afb0be8950f4891c50fc1e8b8c3a";
    hash = "sha256-22HNH87AuXaJ3yJjRdXHHnjLgu3IwZZxo6hcaTvYXOw=";
  };

  nativeBuildInputs = with kdePackages; [
    kpackage
    typescript
  ];

  buildInputs = with kdePackages; [ kwin ];

  dontWrapQtApps = true;

  npmDepsHash = "sha256-/XUO3bzbLGMrFd1J5TqqTrRCmbOSzs1SzYQB6Y9blyU=";

  dontNpmBuild = true;

  patchPhase = ''
    substituteInPlace Makefile \
      --replace "npm install --save-dev" "" \
      --replace "npm run tsc --" "tsc"
  '';

  postPatch = ''
    cp ${./package-lock.json} package-lock.json
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