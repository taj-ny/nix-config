{ prev }:

prev.plasma5Packages.plasma5.kwin.overrideAttrs (old: {
  src = prev.fetchFromGitHub {
    owner = "taj-ny";
    repo = "kwin-forceblur-wayland";
    rev = "v5.27.10";
    hash = "sha256-l0a5hQPRQagQ89QE3qqNYAWtIPZThFksyMiIodPhUIQ=";
  };
})
