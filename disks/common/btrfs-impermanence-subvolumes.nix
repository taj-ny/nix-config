{ btrfsOptions ? import ./btrfs-options.nix { } }:

{
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
}
