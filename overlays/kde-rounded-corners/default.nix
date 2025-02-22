prev: prev.kde-rounded-corners.overrideAttrs (old: {
  version = "23-10-2024";
  src = prev.fetchFromGitHub {
    owner = "matinlotfali";
    repo = "KDE-Rounded-Corners";
    rev = "17586b06e1d4b71f65611c7f853a21f6afa7aa04"; # No shadow interpolation
    hash = "sha256-49BZxgcKyqQGts8I7TUe3N656PhLqcLRp+z8/Iw36yM=";
  };
  patches = (old.patches or []) ++ [ ./optimizations.patch ];
})
