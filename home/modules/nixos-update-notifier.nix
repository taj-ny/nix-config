{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.programs.nixos-update-notifier;
in
{
  options.programs.nixos-update-notifier = with types; {
    enable = mkEnableOption "nixos-update-notifier";
    watchedFlakeInputs = mkOption {
      type = listOf str;
      description = "Flake inputs to watch";
    };
  };

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [ nixos-update-notifier ];

      file.".config/nixos-update-notifier".text = builtins.concatStringsSep "\n" cfg.watchedFlakeInputs;
    };

    systemd.user = {
      services.nixos-update-notifier = {
        Service = {
          Type = "oneshot";
          ExecStart = ''
            ${pkgs.python3}/bin/python3 ${pkgs.nixos-update-notifier}/nixos-update-notifier.py
          '';
        };

        Install.WantedBy = [ "default.target" ];
        Unit.Description = "nixos-update-notifier service";
      };

      timers.nixos-update-notifier = {
        Timer = {
          Unit = "nixos-update-notifier";
          OnBootSec = "1min";
          OnUnitActiveSec = "1h";
        };

        Install.WantedBy = [ "timers.target" ];
        Unit.Description = "timer for nixos-update-notifier service";
      };
    };
  };
}
