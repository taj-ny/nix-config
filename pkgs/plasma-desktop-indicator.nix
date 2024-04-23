{ lib
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "plasma-desktop-indicator";
  version = "0.3";

  src = fetchFromGitHub {
    owner = "dhruv8sh";
    repo = "plasma6-desktop-indicator";
    rev = "v${version}";
    hash = "sha256-hfunwZZXdl9MkDbhEKoD3uKDj2rJqkjQHJSXHGH4H54=";
  };

  installPhase = ''
    mkdir -p $out/share/plasma/plasmoids/org.kde.plasma.plasm6desktopindicator
    cp -r ./{contents,metadata.json} $out/share/plasma/plasmoids/org.kde.plasma.plasm6desktopindicator
  '';

  meta = {
    description = "Plasma 6 applet in order to show virtual desktops in a minimal way";
    homepage = "https://github.com/dhruv8sh/plasma6-desktop-indicator";
    license = lib.licenses.gpl3Plus;
  };
}
