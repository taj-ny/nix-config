{ inputs, outputs, pkgs, ... }:

let
  username = "marcin";
in
{
  imports = [
    ./programs

    ./nixos-update-notifier.nix
    ./nix.nix
    ./xdg.nix

    "${inputs.impermanence}/home-manager.nix"
  ] ++ (builtins.attrValues outputs.homeManagerModules);

  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    packages = with pkgs; [
      axel
      duf
      eza
      fastfetch
      ffmpeg
      gimp
      imagemagick
      libreoffice-fresh
      obs-studio
      rclone
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

      persistentFiles = [
        ".config/rclone/rclone.conf"
      ];
    };

    programs = {
      clementine.enable = true;
      google-chrome.enable = true; # Just in case something doesn't work on Firefox. It's sandboxed.
      kdeconnect.enable = true;
      keepassxc.enable = true;
    };
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
