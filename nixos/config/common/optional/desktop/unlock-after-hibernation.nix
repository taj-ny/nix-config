{ pkgs, ... }:

# Warning: This will unlock ALL sessions!
{
  systemd.services.unlock-after-hibernation = {
    after = [ "hibernate.target" ];
    wantedBy = [ "hibernate.target" ];

    serviceConfig.ExecStart = "${pkgs.systemd}/bin/loginctl unlock-sessions";
  };
}
