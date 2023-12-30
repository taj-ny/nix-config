{
  imports = [
    ./common/global

    ./common/optional/desktop/kde.nix

    ./common/optional/programs/gaming/prismlauncher.nix

    ./common/optional/programs/drawing/gimp.nix
    ./common/optional/programs/drawing/inkscape.nix
    ./common/optional/programs/drawing/krita.nix

    ./common/optional/programs/music/beets.nix
    ./common/optional/programs/music/deemix.nix
    ./common/optional/programs/music/strawberry.nix

    ./common/optional/programs/office/freeoffice.nix
    ./common/optional/programs/office/libreoffice.nix

    #./common/optional/programs/programming/unityhub.nix
    ./common/optional/programs/programming/vscode.nix

    ./common/optional/programs/programming/ide/clion.nix
    ./common/optional/programs/programming/ide/idea-ultimate.nix
    ./common/optional/programs/programming/ide/phpstorm.nix
    ./common/optional/programs/programming/ide/pycharm-professional.nix
    ./common/optional/programs/programming/ide/rider.nix
    ./common/optional/programs/programming/ide/webstorm.nix

    ./common/optional/programs/programming/sdks/dotnet.nix
    ./common/optional/programs/programming/sdks/php.nix
    ./common/optional/programs/programming/sdks/python.nix

    ./common/optional/programs/yubikey/yubikey-manager-qt.nix
    ./common/optional/programs/yubikey/yubikey-manager.nix
    #./common/optional/programs/yubikey/yubico-authenticator.nix

    ./common/optional/programs/terminal/konsole
    ./common/optional/programs/terminal/zsh

    ./common/optional/programs/web-browsers/firefox.nix
    ./common/optional/programs/web-browsers/tor-browser.nix
    ./common/optional/programs/web-browsers/ungoogled-chromium.nix

    ./common/optional/programs/cryptomator.nix
    ./common/optional/programs/easyeffects.nix
    ./common/optional/programs/kdeconnect.nix
    ./common/optional/programs/keepassxc.nix
    ./common/optional/programs/obs-studio.nix
    ./common/optional/programs/vlc.nix
  ];

  # TODO Consider using TLP instead
  desktop.kde.configs.powermanagementprofilesrc = {
    "AC -> PowerProfile".profile = "performance";
    "Battery -> PowerProfile".profile = "performance";
    "LowBattery -> PowerProfile".profile = "power-saver";
  };

  home.stateVersion = "23.05";
}
