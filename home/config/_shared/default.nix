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
        duf
        eza
        distrobox
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
      inherit (pkgs.dotnetCorePackages)
        sdk_9_0;
      inherit (pkgs.kdePackages)
        ark
        kate
        krdc
        krfb
        filelight
        yakuake;
    };
    sessionVariables.SSH_AUTH_SOCK = "/run/user/1000/ssh-agent";
    wallpaper = "${pkgs.wallpaper}/wallpaper.png";
  };
  nix.gc = {
    inherit (osConfig.nix.gc) automatic options;
    frequency = builtins.toString osConfig.nix.gc.dates;
  };
  persistence.directories = [
    ".cache"
    ".cert" # NetworkManager OpenVPN
    ".local/share/containers"
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
  custom.programs = {
    ccache.enable = true;
    clementine.enable = true;
    kdeconnect.enable = true;
    keepassxc.enable = true;
    rclone.enable = true;
    yakuake.enable = true;
  };
  programs = {
    btop.enable = true;
    firefox.enable = true;
    home-manager.enable = true;
    vscode.enable = true;
    zsh.enable = true;
  };
  services = {
    easyeffects.enable = true;
  };
  systemd.user.startServices = "sd-switch";
}