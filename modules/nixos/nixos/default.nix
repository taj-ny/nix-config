{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.modules.nixos;
in
{
  imports = [
    ./impermanence.nix
  ];

  options.modules.nixos = with types; {
    deviceType = mkOption {
      type = enum [ "laptop" "pc" "server" ];
    };

    kernel = mkOption {
      default = "latest";
      type = nullOr (enum [ "latest" "lts" ]);
    };
  };

  config = {
    boot.kernelPackages = mkIf (cfg.kernel == "latest") pkgs.linuxPackages_latest;
    powerManagement.cpuFreqGovernor = mkForce (if cfg.deviceType == "laptop" then "powersave" else "performance");
    services.power-profiles-daemon.enable = mkIf (cfg.deviceType != "laptop") (mkForce false);
  };
}

