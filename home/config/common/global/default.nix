{
  inputs,
  osConfig,
  outputs,
  pkgs,
  username,
  ...
}:

{
  imports = [
    "${inputs.impermanence}/home-manager.nix"

    ./programs
    ./colors.nix
    ./xdg.nix
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
      meslo-lgs-nf
      obs-studio
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
      google-chrome.enable = true; # Just in case something doesn't work on Firefox. It's sandboxed.
      kdeconnect.enable = true;
      keepassxc.enable = true;
      rclone.enable = true;
    };
  };

  nixpkgs = {
    inherit (osConfig.nixpkgs) overlays config;
  };

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
