{
  imports = [
    ./common

    ./common/desktop/kde

    ./common/programs/easyeffects.nix
    ./common/programs/kdeconnect.nix
    ./common/programs/keepassxc.nix

    ./common/programs/gaming/prismlauncher.nix

    ./common/programs/music/beets.nix
    ./common/programs/music/strawberry.nix

    ./common/programs/office/libreoffice.nix

    ./common/programs/programming/git.nix
    ./common/programs/programming/rider.nix
    ./common/programs/programming/vscode.nix

    ./common/programs/web/firefox.nix
    ./common/programs/web/tor-browser.nix
    ./common/programs/web/ungoogled-chromium.nix
  ];

  desktop.kde.configs = {
    #powermanagementprofilesrc.AC.PowerProfile.profile = "performance";
  };

  home.stateVersion = "23.05";
}
