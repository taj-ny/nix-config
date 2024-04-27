{ config, lib, modulesPath, inputs, ... }:

{
  imports = [
    inputs.hardware.nixosModules.common-cpu-intel-cpu-only
    inputs.hardware.nixosModules.common-pc
    inputs.hardware.nixosModules.common-pc-ssd
    ./hardware-configuration.nix

    ../common/global

    ../common/optional/boot/plymouth.nix

    ../common/optional/desktop/display-manager/lightdm.nix
 
    ../common/optional/desktop/kde

    ../common/optional/fs/luks-btrfs-impermanence.nix

    ../common/optional/hardware/external/printers.nix
    ../common/optional/hardware/external/yubikey.nix

    ../common/optional/hardware/internal/bluetooth.nix
    ../common/optional/hardware/internal/gpu/nvidia.nix

    ../common/optional/kernel/linux-latest.nix

    ../common/optional/programs/adb.nix
    ../common/optional/programs/kdeconnect.nix
    ../common/optional/programs/neovim.nix
    ../common/optional/programs/partition-manager.nix
    ../common/optional/programs/piper.nix
    ../common/optional/programs/rclone.nix
    ../common/optional/programs/steam.nix
    ../common/optional/programs/vmware.nix

    ../common/optional/services/fwupd.nix
    ../common/optional/services/pipewire.nix
    ../common/optional/services/ssh-agent.nix
    ../common/optional/services/syncthing.nix
    ../common/optional/services/tor.nix

    ../common/optional/encrypted-dns.nix

    ../common/users/marcin
  ];

  environment.variables.KWIN_FORCE_SW_CURSOR = "1";
  services.power-profiles-daemon.enable = lib.mkForce false;

  networking.hostName = "andromeda";
  system.stateVersion = "23.05";
  powerManagement.cpuFreqGovernor = lib.mkForce "performance";
}
