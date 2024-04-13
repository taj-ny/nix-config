{ lib
, stdenv
, fetchFromGitHub
}:

# This package doesn't include the plugin, as I couldn't get it to build, but the plasmoid seems to work fine without it.
stdenv.mkDerivation rec {
  pname = "plasma-panel-spacer-extended";
  version = "1.5.4";

  src = fetchFromGitHub {
    owner = "luisbocanegra";
    repo = "plasma-panel-spacer-extended";
    rev = "v${version}";
    hash = "sha256-TZD+Tm6iBS6B3O2tu816PUSXbPH2W37ZZD9HDqHEGv8=";
  };

  installPhase = ''
    mkdir -p $out/share/plasma/plasmoids/luisbocanegra.panelspacer.extended
    cp -r $src/package/* $out/share/plasma/plasmoids/luisbocanegra.panelspacer.extended
  '';

  meta = {
    description = "Plasma panel spacer with mouse actions";
    homepage = "https://github.com/luisbocanegra/plasma-panel-spacer-extended";
  };
}
