{
  pkgs,
  ...
}:

# Devices with swapfiles have them on an encrypted partition and are used by one person only, so this is safe.
{
  systemd.services.unlock-after-hibernation = {
    after = [ "hibernate.target" ];
    wantedBy = [ "hibernate.target" ];
    serviceConfig.ExecStart = "${pkgs.systemd}/bin/loginctl unlock-sessions";
  };
}
