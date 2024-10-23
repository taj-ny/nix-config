{
  lib,
  osConfig,
  pkgs,
  username,
  ...
}:

{
  imports = lib.allExceptThisDefault ./.;

  custom.programs.plasma.enable = true;
  fonts.fontconfig.enable = true;
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    packages = builtins.attrValues {
      inherit (pkgs)
        axel
        dotnet-sdk_8
        duf
        eza
        fastfetch
        ffmpeg
        gimp
        imagemagick
        jetbrains-mono
        krita
        libreoffice-fresh
        meslo-lgs-nf
        mono
        obs-studio
        php
        piper
        python3Full
        qalculate-qt
        rsync
        tmux
        tor-browser-bundle-bin
        unzip
        vlc
        wl-clipboard
        yt-dlp
        yubikey-manager;
      inherit (pkgs.kdePackages)
        ark
        kate
        krdc
        krfb
        yakuake;
    };
    sessionVariables.SSH_AUTH_SOCK = "/run/user/1000/ssh-agent";
    wallpaper = "${pkgs.wallpaper}/wallpaper.png";
  };
  nix.gc = {
    inherit (osConfig.nix.gc) automatic options;
    frequency = osConfig.nix.gc.dates;
  };
  persistence.directories = [
    ".cache"
    ".cert" # NetworkManager OpenVPN
    ".local/state/wireplumber"
    ".nuget"
    ".ssh"
    ".vmware"
    "Documents"
    "Downloads"
    "keepass"
    "Pictures"
    "Projects"
    "Videos"
    "Virtual Machines"
  ] ++ (
    lib.optionals
      osConfig.programs.steam.enable
      [
        ".local/share/Steam"
        ".steam"
      ]
  ) ++ (
    lib.optionals
      osConfig.services.syncthing.enable
      [ ".syncthing" ]
  );
  programs = {
    btop.enable = true;
    clementine.enable = true;
    firefox.enable = true;
    home-manager.enable = true;
    keepassxc.enable = true;
    rclone.enable = true;
    vscode.enable = true;
    yakuake.enable = true;
    zsh.enable = true;
  };
  services = {
    easyeffects.enable = true;
    kdeconnect.enable = true;
  };
  systemd.user.startServices = "sd-switch";
}