{ config, inputs, lib, pkgs, ... }:

with lib;
let
  cfg = config.modules.nixos.impermanence;
in
{
  imports = [
    inputs.impermanence.nixosModules.impermanence
  ];

  options.modules.nixos.impermanence = with types; {
    enable = mkOption {
      default = true;
      description = "Whether to enable impermanence.";
      type = types.bool;
    };

    rootSize = mkOption {
      description = "Size of the root tmpfs in gibibytes.";
      default = 1;
      type = types.int;
    };
  }; 

  config = mkIf cfg.enable {
    environment.persistence."/persist" = {
      hideMounts = true;

      directories = [
        "/etc/NetworkManager/system-connections"
        "/etc/secureboot"
        "/etc/ssh"
        "/etc/vmware"
        "/var/lib/bluetooth"
        "/var/lib/systemd"
        "/var/lib/nixos"
        "/var/log"
      ];

      files = [
        "/etc/machine-id"
      ];
    };

    fileSystems."/" = {
      device = "tmpfs";
      fsType = "tmpfs";
      options = [ "size=${toString cfg.rootSize}G" "mode=755" ];
    };
  };
}

