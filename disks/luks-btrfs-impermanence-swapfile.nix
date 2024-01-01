{ disks, lib }:

{
  imports = [
    ./btrfs-impermanence.nix
  ]

  disko.devices.disk.main.content.partitions = {
    nixos = lib.mkForce null;
    nixos-luks = {
      start = "513MiB";
      end = "100%";

      content = {
        type = "luks";
        name = "nixos";

        content = {
          type = "btrfs";
          subvolumes = lib.mkMerge (import ./common/btrfs-impermanence-subvolumes.nix { }) {
            "/@swap" = {
              mountpoint = "/swap";
              mountOptions = import ./common/btrfs-options.nix { };
            };
          };
        };
      };
    };
  };
}
