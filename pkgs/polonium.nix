{
  buildNpmPackage,
  fetchFromGitHub,
  kdePackages,
  lib
}:

buildNpmPackage rec {
  pname = "polonium";
  version = "2024-07-09";

  src = fetchFromGitHub {
    owner = "zeroxoneafour";
    repo = "polonium";
    rev = "f17754a76efb3b07a4dbde53e0d2c055271a4882";
    hash = "sha256-GCSL3eg4729uNVZVAFUgCO3i0BiOkFgxQNgXbBCz1XA=";
  };

  npmDepsHash = "sha256-kaT3Uyq+/JkmebakG9xQuR4Kjo7vk6BzI1/LffOj/eo=";

  dontConfigure = true;

  buildFlags = [ "res" "src" ];

  nativeBuildInputs = [ kdePackages.kpackage ];

  dontNpmBuild = true;

  dontWrapQtApps = true;

  installPhase = ''
    runHook preInstall

    kpackagetool6 -i pkg --packageroot $out/share/kwin/scripts

    runHook postInstall
  '';

  meta = with lib; {
    description = "Auto-tiler that uses KWin 6.0+ tiling functionality";
    homepage = "https://github.com/zeroxoneafour/polonium";
    license = licenses.mit;
  };
}
