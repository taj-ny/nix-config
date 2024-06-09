{ config, lib, ... }:

with lib;
let
  cfg = config.modules.fs;
in
{
  options.modules.fs = with types; {
    layout = mkOption {
      default = null;
      type = nullOr (submodule {
        options = {
          predefined = mkEnableOption { type = bool; };
          withLuks = mkEnableOption "LUKS";
          withSwap = mkEnableOption "swap";
        };
      });
    };

    extraDevices = mkOption {
      default = {};
      type = attrsOf (submodule ({ name, ... }: {
        options = {
          name = mkOption { type = str; };
          keyFile = mkOption { type = str; };
          subvolumes = mkOption { type = attrsOf str; };
        };
      }));
    };
  };

  config =
    let
      btrfsOptions = [ "noatime" "nodiratime" "discard=async" ];
      device = if cfg.layout.withLuks then "/dev/mapper/nixos" else "/dev/disk/by-partlabel/nixos";
    in
    mkIf (cfg.layout != null && cfg.layout.predefined == true) {
      boot = {
        resumeDevice = mkIf cfg.layout.withSwap device;

        initrd.luks.devices."nixos" = mkIf cfg.layout.withLuks {
          allowDiscards = true;
          bypassWorkqueues = true;
          device = "/dev/disk/by-partlabel/nixos-luks";
        };
      };

      fileSystems = {
        "/" = mkIf (config.modules.nixos.impermanence.enable == false) {
          inherit device;
          fsType = "btrfs";
          options = [ "subvol=/@" ] ++ btrfsOptions;
        };

        "/boot" = {
          device = "/dev/disk/by-partlabel/boot";
          fsType = "vfat";
        };

        "/home" = {
          inherit device;
          fsType = "btrfs";
          options = [ "subvol=/@home" ] ++ btrfsOptions;
        };

        "/nix" = {
          inherit device;
          fsType = "btrfs";
          options = [ "subvol=/@nix" ] ++ btrfsOptions;
        };

        "/swap" = mkIf cfg.layout.withSwap {
          inherit device;
          fsType = "btrfs";
          options = [ "subvol=/@swap" ] ++ btrfsOptions;
        };
      } // listToAttrs (
        flatten (
          map (device:
            map (subvolume:
              {
                name = subvolume.value;
                value = {
                  device = "/dev/mapper/${device.name}";
                  fsType = "btrfs";
                  options = [ "subvol=/${subvolume.name}" "nofail" "noauto" "x-systemd.automount" ];
                };
              }
            ) (attrsToList device.value.subvolumes)
          ) (attrsToList cfg.extraDevices)
        )
      );

      swapDevices = mkIf cfg.layout.withSwap [
        {
          device = "/swap/swapfile";
        }
      ];

      environment.etc.crypttab.text = ''
        ${concatMapStringsSep "\n" (x: "${x.name} PARTLABEL=${x.name} ${x.value.keyFile} noauto") (attrsToList cfg.extraDevices)}
      '';
    };
}
