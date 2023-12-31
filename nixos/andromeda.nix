{ config, lib, modulesPath, pkgs, inputs, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")

    inputs.hardware.nixosModules.common-cpu-intel-cpu-only
    inputs.hardware.nixosModules.common-gpu-nvidia-nonprime
    inputs.hardware.nixosModules.common-pc
    inputs.hardware.nixosModules.common-pc-ssd

    ./common

    ./common/desktop/kde.nix

    ./common/fs/btrfs-luks.nix

    ./common/hardware/bluetooth.nix
    ./common/hardware/gpu/nvidia.nix

    ./common/programs/piper.nix
    ./common/programs/rclone.nix
    ./common/programs/steam.nix
    #./common/programs/vmware.nix

    ./common/users/marcin
    ./common/users/root.nix
  ];

  boot = {
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];

    initrd = {
      availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" "sr_mod" ];
      kernelModules = [ ];
    };
  };

  swapDevices = [ ];

  networking.hostName = "andromeda";
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "performance";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
