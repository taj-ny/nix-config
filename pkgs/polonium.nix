{ lib
, fetchFromGitHub
, buildNpmPackage
, kdePackages
}:

buildNpmPackage rec {
  pname = "polonium";
  version = "1.0rc";

  src = fetchFromGitHub {
    owner = "zeroxoneafour";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-AdMeIUI7ZdctpG/kblGdk1DBy31nDyolPVcTvLEHnNs=";
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
