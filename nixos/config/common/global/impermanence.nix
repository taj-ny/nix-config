{
  custom.impermanence = {
    enable = true;

    persistentDirectories = [
      "/etc/NetworkManager/system-connections"
      "/etc/ssh"
      "/var/lib/systemd"
      "/var/lib/nixos"
      "/var/log"
    ];

    persistentFiles = [
      "/etc/machine-id"
    ];
  };
}
