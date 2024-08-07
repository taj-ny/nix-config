{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.custom.hardware.external.yubikey;
in
{
  options.custom.hardware.external.yubikey.enable = mkEnableOption "YubiKey support";

  config.services = mkIf cfg.enable {
    pcscd.enable = true;

    udev.packages = with pkgs; [
      yubikey-personalization
      libu2f-host
    ];
  };
}
