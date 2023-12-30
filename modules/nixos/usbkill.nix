{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.programs.usbkill;
in
{
  options.programs.usbkill.enable = mkEnableOption "usbkill";

  config.environment = mkIf cfg.enable {
    systemPackages = with pkgs; [ usbkill ];
    etc."usbkill.ini".source = "${pkgs.usbkill}/lib/python3.11/site-packages/etc/usbkill.ini"; # There's probably a better way to do this
  };
}
