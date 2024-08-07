{
  osConfig,
  pkgs,
  username,
  ...
}:

{
  imports = [
    ./programs
    ./colors.nix
    ./xdg.nix
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    packages = with pkgs; [
      ark
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
      rsync
      tmux
      tor-browser-bundle-bin
      unzip
      vlc
      wl-clipboard
      yt-dlp
      yubikey-manager
    ];
  };

  custom = {
    impermanence = {
      enable = true;

      persistentDirectories =
        let
          symlink = directory: {
            inherit directory;
            method = "symlink";
          };
        in
        [
          ".cert" # NetworkManager OpenVPN
          ".config/JetBrains"
          ".java/.userPrefs"
          ".local/share/JetBrains"
          ".local/share/Steam"
          ".local/state/wireplumber"
          ".ssh"
          ".syncthing"
          "Documents"
          "Downloads"
          "Pictures"
          "Projects"
          "Virtual Machines"
        ];
    };

    programs = {
      clementine.enable = true;
      firefox.enable = true;
      google-chrome.enable = true; # Just in case something doesn't work on Firefox. It's sandboxed.
      kdeconnect.enable = true;
      keepassxc.enable = true;
      nixos-update-notifier.enable = true;
      plasma.enable = true;
      rclone.enable = true;
    };
  };

  programs = {
    btop.enable = true;
    vscode.enable = true;
    zsh.enable = true;
  };

  services.easyeffects.enable = true;

  nix.gc = {
    inherit (osConfig.nix.gc) automatic options;
    frequency = osConfig.nix.gc.dates;
  };

  home.file =
    let
      mkDesktopFile = icon: ''
        [Desktop Entry]
        Icon=${icon}
      '';
    in
    {
      "Projects/.directory".text = mkDesktopFile "code-context";
    };

  fonts.fontconfig.enable = true;
  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";
}
