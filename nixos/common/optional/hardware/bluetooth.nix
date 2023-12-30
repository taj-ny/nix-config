{ pkgs, ... }:

{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  # Headset buttons support
  systemd.user.services.mpris-proxy = {
    description = "Mpris proxy";
    after = [ "network.target" "sound.target" ];
    wantedBy = [ "default.target" ];
    serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
  };
}
