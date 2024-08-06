{
  inputs,
  ...
}:

{
  imports = [
    inputs.impermanence.nixosModules.impermanence
  ];

  environment.persistence."/nix/persist" = {
    hideMounts = true;

    directories = [
      "/var/lib/bluetooth"
      "/var/lib/systemd"
      "/var/lib/nixos"
      "/var/log"
      "/etc/NetworkManager/system-connections"
      "/etc/secureboot"
      "/etc/ssh"
      "/etc/vmware"
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
