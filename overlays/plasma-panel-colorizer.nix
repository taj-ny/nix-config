prev: prev.plasma-panel-colorizer.overrideAttrs (old: rec {
  version = "0.5.2";
  src = prev.fetchFromGitHub {
    owner = "luisbocanegra";
    repo = "plasma-panel-colorizer";
    rev = "v${version}";
    hash = "sha256-+JweNB+zjbXh6Htyvu2vgogAr5Fl5wDPCpm6GV18NJ0=";
  };
})