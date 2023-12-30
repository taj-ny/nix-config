{ lib, fetchFromGitHub, stdenv, ... }:

# Won't work in home.packages
stdenv.mkDerivation rec {
  pname = "paneltransparencybutton";
  version = "0.2.0";

  src = fetchFromGitHub {
    owner = "psifidotos";
    repo = "paneltransparencybutton";
    rev = version;
    hash = "sha256-F1aPZ7RY6eHSzLRzd2u3JtGOteaV4g8DDrbQDg8u2xs=";
  };

  phases = [ "unpackPhase" "installPhase" ];

  installPhase = ''
    mkdir -p $out/share/plasma/plasmoids/org.kde.paneltransparencybutton
    cp -r $src/* $out/share/plasma/plasmoids/org.kde.paneltransparencybutton
  '';

  meta = {
    description = "A button to enable/disable transparency for specific plasma panels";
    homepage = "https://github.com/psifidotos/paneltransparencybutton";
    changelog = "https://github.com/psifidotos/paneltransparencybutton/releases/tag/${version}";
    license = with lib.licenses; [ gpl2Plus ];
    maintainers = [ "taj_ny" ];
  };
}
