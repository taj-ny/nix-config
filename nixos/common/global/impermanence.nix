{ inputs, lib, ... }:

with lib;
{
  imports = [
    inputs.impermanence.nixosModules.impermanence
  ];

  environment.persistence."/persist" = {
    hideMounts = true;

    directories = [
      "/etc/NetworkManager/system-connections"
      "/etc/vmware"
      "/etc/secureboot"
      "/etc/ssh"
      "/var/lib/bluetooth"
      "/var/lib/systemd"
      "/var/lib/nixos"
      "/var/log"
    ];

    files = [
      "/etc/machine-id"
    ];
  };

  fileSystems."/" = {
    device = "tmpfs";
    fsType = "tmpfs";
    options = [ "size=8G" "mode=755" ];
  };
}
