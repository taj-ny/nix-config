{ config, lib, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")

    ./throttled.nix

    ../common/global

    ../common/optional/desktop/display-manager/lightdm.nix

    ../common/optional/desktop/kde
    ../common/optional/desktop/kde/optional/wayland-default-session.nix

    ../common/optional/fs/luks-btrfs-impermanence-swapfile.nix

    ../common/optional/hardware/bluetooth.nix

    ../common/optional/kernel/linux-latest.nix

    ../common/optional/programs/kdeconnect.nix
    ../common/optional/programs/piper.nix
    ../common/optional/programs/steam.nix
    ../common/optional/programs/vmware.nix

    ../common/optional/services/pipewire.nix
    ../common/optional/services/tor.nix

    ../common/optional/security/secure-boot.nix
    ../common/optional/security/u2f-pam.nix

    ../common/optional/encrypted-dns.nix
    ../common/optional/tor-service.nix

    ../common/users/marcin
    ../common/users/root.nix
  ];

  boot = {
    kernelModules = [ "kvm-intel" ];
    kernelParams = [ "resume_offset=53848001" ];

    extraModprobeConfig = ''
      options thinkpad_acpi fan_control=1
    '';

    initrd.availableKernelModules = [ "xhci_pci" "nvme" "uas" "usb_storage" "sd_mod" ];
  };

  boot.initrd.systemd.enable = true;

  programs.usbkill.enable = true;

  networking.hostName = "thinkpad";
  system.stateVersion = "23.05";
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "performance";
}
