{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.modules.hardware.external.yubikey;
in
{
  options.modules.hardware.external.yubikey.enable = mkEnableOption "YubiKey support";

  config.services = mkIf cfg.enable {
    udev.packages = with pkgs; [ yubikey-personalization libu2f-host ];
    pcscd.enable = true;
  };
}
