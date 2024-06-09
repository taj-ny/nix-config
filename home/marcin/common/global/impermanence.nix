{ inputs, ... }:

{
  imports = [
    "${inputs.impermanence}/home-manager.nix"
  ];

  home.persistence."/nix/persist/home/marcin" = {
    allowOther = true;

    directories = [
      ".cert" # NetworkManager OpenVPN
      ".config/Clementine"
      ".config/JetBrains"
      ".config/kdeconnect"
      ".config/nicotine"
      ".local/share/baloo"
      ".local/share/dolphin"
      ".local/share/kwalletd"
      ".local/share/nicotine"
      ".local/share/Trash"
      ".mozilla/firefox"
      ".ssh"
      ".syncthing"
      "Documents"
      "Downloads"
      "keepass"
      "Pictures"
      "Projects"
      "Virtual Machines"
    ];

    files = [
      ".config/deemix/.arl"
      ".config/keepassxc/keepassxc.ini"
      ".config/rclone/rclone.conf"
      ".zsh_history"
    ];
  };
}
