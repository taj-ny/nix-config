{ disks, lib, ... }:

{
  disko = (import ./btrfs-impermanence.nix { 
    inherit disks; 

    customNixosPartition = {
      label = "nixos-luks";
      size = "100%";

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
  }).disko;
}
