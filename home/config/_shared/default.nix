{
  lib,
  osConfig,
  pkgs,
  username,
  ...
}:

{
  imports = lib.allExceptThisDefault ./.;

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
          ".local/state/wireplumber"
          ".ssh"
          "Documents"
          "Downloads"
          "Pictures"
          "Projects"
          "Videos"
          "Virtual Machines"
        ] ++ (lib.optionals osConfig.programs.steam.enable [ ".local/share/Steam" ])
          ++ (lib.optionals osConfig.services.syncthing.enable [ ".syncthing" ]);
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
  fonts.fontconfig.enable = true;
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
      kate
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
    sessionVariables.SSH_AUTH_SOCK = "/run/user/1000/ssh-agent";
  };
  nix.gc = {
    inherit (osConfig.nix.gc) automatic options;
    frequency = osConfig.nix.gc.dates;
  };
  programs = {
    btop.enable = true;
    home-manager.enable = true;
    vscode.enable = true;
    zsh.enable = true;
  };
  services.easyeffects.enable = true;
  systemd.user.startServices = "sd-switch";
}
