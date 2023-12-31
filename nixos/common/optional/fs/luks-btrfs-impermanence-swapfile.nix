let
  btrfsOptions = [ "noatime" "nodiratime" "discard=async" ];
in
{
  boot = {
    # Add kernelParams = [ "resume_offset=..." ]; to device-specific configuration
    # btrfs inspect-internal map-swapfile -r /swap/swapfile
    resumeDevice = "/dev/mapper/nixos";

    initrd.luks.devices."nixos".device = "/dev/disk/by-partlabel/nixos-luks";
  };

  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-partlabel/boot";
      fsType = "vfat";
    };

    "/home" = {
      device = "/dev/mapper/nixos";
      fsType = "btrfs";
      options = [ "subvol=/@home" ] ++ btrfsOptions;
    };

    "/nix" = {
      device = "/dev/mapper/nixos";
      fsType = "btrfs";
      options = [ "subvol=/@nix" ] ++ btrfsOptions;
    };

    "/persist" = {
      device = "/dev/mapper/nixos";
      fsType = "btrfs";
      neededForBoot = true;
      options = [ "subvol=/@persist" ] ++ btrfsOptions;
    };

    "/swap" = {
      device = "/dev/mapper/nixos";
      fsType = "btrfs";
      options = [ "subvol=/@swap" ] ++ btrfsOptions;
    };
  };

  swapDevices = [
    {
      device = "/swap/swapfile";
    }
  ];
}
