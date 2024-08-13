{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.custom.hardware.internal.bluetooth;
in
{
  options.custom.hardware.internal.bluetooth.enable = mkEnableOption "Bluetooth";

  config = mkIf cfg.enable {
    custom.impermanence.persistentDirectories = [ "/var/lib/bluetooth" ];
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
  };
}