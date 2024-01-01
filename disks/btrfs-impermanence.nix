{ disks, ... }:

{
  disko.devices = {
    disk.main = {
      type = "disk";
      device = builtins.elemAt disks 0;

      content = {
        type = "table";
        format = "gpt";

        partitions = {
          boot = {
            start = "1MiB";
            end = "513MiB";
            fs-type = "fat32";
            bootable = true;

            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
            };
          };

          nixos = {
            start = "513MiB";
            end = "100%";

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
