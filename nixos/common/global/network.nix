{ lib, ... }:

{
  networking = {
    useDHCP = lib.mkDefault false;

    extraHosts = ''
      192.168.1.100 andromeda
      192.168.1.101 thinkpad
    '';

    networkmanager.enable = true;

    #firewall.enable = true;
  };

  systemd.targets.network-online.wantedBy = lib.mkForce [];
}
