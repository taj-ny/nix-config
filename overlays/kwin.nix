{ prev }:

prev.plasma5Packages.plasma5.kwin.overrideAttrs (old: {
  src = prev.fetchFromGitHub {
    owner = "taj-ny";
    repo = "kwin-forceblur-wayland";
    rev = "b2073237dd32b4545d1522a530359922ad7d35a6";
    hash = "sha256-l0a5hQPRQagQ89QE3qqNYAWtIPZThFksyMiIodPhUIQ=";
  };
})
