{
  fetchFromGitHub,
  stdenv
}:

stdenv.mkDerivation {
  pname = "kara";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "dhruv8sh";
    repo = "kara";
    rev = "v0.1hotfix";
    hash = "sha256-SfPAyUC5qN8jVXd6ECSkkf1yidYMu5ac/hsNtLjUquI=";
  };

  installPhase = ''
    mkdir -p $out/share/plasma/plasmoids/org.dhruv8sh.kara
    cp -r $src/metadata.json $src/contents $out/share/plasma/plasmoids/org.dhruv8sh.kara
  '';

  meta = {
    description = "KDE Plasma Pager Applet ";
    homepage = "https://github.com/dhruv8sh/kara";
  };
}
