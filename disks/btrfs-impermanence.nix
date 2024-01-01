{ disks, ... }:

{
  disko.devices = {
    disk.main = {
      type = "disk";
      device = builtins.elemAt disks 0;

      content = {
        type = "gpt";

        partitions = {
          boot = {
            label = "boot";
            size = "512M";
            type = "EF00";

            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
            };
          };

          nixos = {
            label = "nixos";
            size = "100%";

            content = {
              type = "btrfs";
              subvolumes = import ./common/btrfs-impermanence-subvolumes.nix { }; 
            };
          };
        };
      };
    };

    nodev."/" = {
      fsType = "tmpfs";
      mountOptions = [
        "defaults"
        "size=3G"
        "mode=755"
      ];
    };
  };
}
