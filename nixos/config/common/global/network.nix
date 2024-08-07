{ lib, ... }:

{
  networking = {
    useDHCP = lib.mkForce false;

    extraHosts = ''
      192.168.1.100 andromeda
      192.168.1.101 thinkpad
    '';

    firewall.enable = false;
    networkmanager.enable = true;
  };

  systemd.targets.network-online.wantedBy = lib.mkForce [];
}
