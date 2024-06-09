{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.modules.security.pam-u2f;
in
{
  options.modules.security.pam-u2f.enable = mkEnableOption "U2F for PAM";

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ pam_u2f ];
    services.udev.packages = with pkgs; [ pam_u2f ];

    security.pam = {
      u2f = {
        enable = true;
        cue = true;
        interactive = true;
        control = "required";
        authFile = "/nix/persist/u2f_keys";
      };

      services.kde.u2fAuth = false;
    };
  };
}
