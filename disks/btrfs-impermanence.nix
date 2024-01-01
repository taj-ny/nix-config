{ disks, customNixosPartition ? null, ... }:

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

          # I spent way too much time trying to override this and nothing worked
          nixos = if (customNixosPartition != null) then customNixosPartition else {
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
