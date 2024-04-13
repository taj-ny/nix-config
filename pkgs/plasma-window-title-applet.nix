{ lib
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "plasma-window-title-applet";
  version = "0.5";

  src = fetchFromGitHub {
    owner = "dhruv8sh";
    repo = "plasma6-window-title-applet";
    rev = "v${version}";
    hash = "sha256-B0MlnGbhBFSsX9Bc4uQvdvgMEifRGFOOLkgMAoCzWhE=";
  };

  installPhase = ''
    mkdir -p $out/share/plasma/plasmoids/org.kde.windowtitle
    cp -r $src/package/* $out/share/plasma/plasmoids/org.kde.windowtitle
  '';

  meta = {
    description = "Plasma 6 Window Title applet ";
    homepage = "https://github.com/dhruv8sh/plasma6-window-title-applet";
  };
}
