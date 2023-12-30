{ disks, ... }:

# TODO This is outdated
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
                  # TODO /swap
                  "/@nix" = {
                    mountpoint = "/nix";
                    mountOptions = [
                      "noatime"
                      "nodiratime"
                      "discard=async"
                    ];
                  };

                  "/@persist" = {
                    mountpoint = "/persist";
                      mountOptions = [
                      "noatime"
                      "nodiratime"
                      "discard=async"
                    ];
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
