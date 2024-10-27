{
  lib,
  ...
}:

{
  networking = {
    useDHCP = lib.mkForce false;
    firewall.enable = false;
    networkmanager.enable = true;
  };
  systemd.targets.network-online.wantedBy = lib.mkForce [];
}
