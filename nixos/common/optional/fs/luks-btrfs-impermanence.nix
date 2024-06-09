let
  btrfsOptions = [ "noatime" "nodiratime" "discard=async" ];
in
{
  boot.initrd.luks.devices."nixos" = {
    allowDiscards = true;
    bypassWorkqueues = true;
    device = "/dev/disk/by-partlabel/nixos-luks";
  };

  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-partlabel/boot";
      fsType = "vfat";
    };

    #"/home" = {
    #  device = "/dev/mapper/nixos";
    #  fsType = "btrfs";
    #  options = [ "subvol=/@home" ] ++ btrfsOptions;
    #};

    "/nix" = {
      device = "/dev/mapper/nixos";
      fsType = "btrfs";
      options = [ "subvol=/@nix" ] ++ btrfsOptions;
    };

    #"/persist" = {
    #  device = "/dev/mapper/nixos";
    #  fsType = "btrfs";
    #  neededForBoot = true;
    #  options = [ "subvol=/@persist" ] ++ btrfsOptions;
    #};
  };
}
