{
  # Add kernelParams = [ "resume_offset=..." ]; to device-specific configuration
  # # btrfs inspect-internal map-swapfile -r /swap/swapfile
  boot.resumeDevice = "/dev/mapper/nixos";
}
