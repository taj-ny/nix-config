{
  fetchFromGitHub,
  stdenv
}:

stdenv.mkDerivation rec {
  pname = "plasma-window-title-applet";
  version = "0.5.5";

  src = fetchFromGitHub {
    owner = "dhruv8sh";
    repo = "plasma6-window-title-applet";
    rev = "6d6b939bb8138a8b1640cf2f6d395a3030d7bbaa";
    hash = "sha256-dfJcRbUubv3/1PAWCFtNWzc8nyIcgTW39vryFLOOqzs=";
  };

  installPhase = ''
    mkdir -p $out/share/plasma/plasmoids/org.kde.windowtitle
    cp -r $src/metadata.json $src/contents $out/share/plasma/plasmoids/org.kde.windowtitle
  '';

  meta = {
    description = "Plasma 6 Window Title applet";
    homepage = "https://github.com/dhruv8sh/plasma6-window-title-applet";
  };
}
