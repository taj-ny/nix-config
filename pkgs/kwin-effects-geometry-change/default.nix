{
  fetchFromGitHub,
  lib,
  stdenv
}:

stdenv.mkDerivation rec {
  pname = "kwin-effects-geometry-change";
  version = "1.3";

  src = fetchFromGitHub {
    owner = "peterfajdiga";
    repo = "kwin4_effect_geometry_change";
    rev = "v${version}";
    hash = "sha256-H3cslx6ceAJGXSa0+gNzmUINRoLeYODhGt4pSFfgNbQ=";
  };

  patches = [ ./polonium-virtual-desktop-animation-fix.patch ];

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/share/kwin/effects/kwin4_effect_geometry_change
    cp -r package/* $out/share/kwin/effects/kwin4_effect_geometry_change
  '';

  meta = {
    description = "A KWin animation for windows moved or resized by programs or scripts ";
    homepage = "https://github.com/peterfajdiga/kwin4_effect_geometry_change";
    license = lib.licenses.gpl3Plus;
  };
}
