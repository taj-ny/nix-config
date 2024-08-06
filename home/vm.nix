{
  imports = [
    ./common/global

    ./common/optional/desktop/kde.nix

    ./common/optional/programs/web-browsers/firefox.nix
  ];

  home.stateVersion = "23.11";
}
