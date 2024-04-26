let
  btrfsOptions = [ "noatime" "nodiratime" "discard=async" ];
in
{
  imports = [
    ./luks-btrfs-impermanence.nix
  ];

  # Add kernelParams = [ "resume_offset=..." ]; to device-specific configuration
  # btrfs inspect-internal map-swapfile -r /swap/swapfile
  boot.resumeDevice = "/dev/mapper/nixos";

  fileSystems."/swap" = {
    device = "/dev/mapper/nixos";
    fsType = "btrfs";
    options = [ "subvol=/@swap" ] ++ btrfsOptions;
  };

  swapDevices = [
    {
      device = "/swap/swapfile";
    }
  ];
}
