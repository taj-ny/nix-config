{ disks, ... }:

let
  btrfsOptions = [ "noatime" "nodiratime" "discard=async" ];
in
{
  disko.devices = {
    disk.main = {
      type = "disk";
      device = builtins.elemAt disks 0;

      content = {
        type = "table";
        format = "gpt";

        partitions = [
          {
            name = "boot";
            start = "1MiB";
            end = "513MiB";
            fs-type = "fat32";
            bootable = true;

            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
            };
          }

          {
            name = "nixos-luks";
            start = "513MiB";
            end = "100%";

            content = {
              type = "luks";
              name = "nixos";

              content = {
                type = "btrfs";

                subvolumes = {
                  "/@home" = {
                    mountpoint = "/home";
                    mountOptions = btrfsOptions;
                  };

                  "/@nix" = {
                    mountpoint = "/nix";
                    mountOptions = btrfsOptions;
                  };

                  "/@persist" = {
                    mountpoint = "/persist";
                    mountOptions = btrfsOptions;
                  };

                  "/@swap" = {
                    mountpoint = "/swap";
                    mountOptions = btrfsOptions;
                  };
                };
              };
            };
          }
        ];
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
