{ config, lib, modulesPath, inputs, ... }:

{
  imports = [
    inputs.hardware.nixosModules.lenovo-thinkpad-t480
    ./hardware-configuration.nix

    ./throttled.nix

    ../common/global

    ../common/optional/desktop/unlock-after-hibernation.nix
    ../common/optional/desktop/display-manager/sddm.nix
    ../common/optional/desktop/kde

    ../common/optional/fs/luks-btrfs-impermanence-swapfile.nix

    ../common/optional/kernel/linux-latest.nix

    ../common/optional/programs/adb.nix
    ../common/optional/programs/kdeconnect.nix
    ../common/optional/programs/neovim.nix
    ../common/optional/programs/partition-manager.nix
    ../common/optional/programs/piper.nix
    ../common/optional/programs/rclone.nix
    ../common/optional/programs/steam.nix
    #../common/optional/programs/vmware.nix

    ../common/optional/services/fwupd.nix
    ../common/optional/services/mysql.nix
    ../common/optional/services/pipewire.nix
    ../common/optional/services/ssh-agent.nix
    ../common/optional/services/syncthing.nix
    ../common/optional/services/tor.nix

    ../common/optional/security/secure-boot.nix
    ../common/optional/security/u2f-pam.nix

    ../common/optional/allow-remote-deployment.nix
    ../common/optional/encrypted-dns.nix

    ../common/users/marcin
  ];

  boot = {
    kernelParams = [ "resume_offset=53848001" ];
    extraModprobeConfig = ''
      options thinkpad_acpi fan_control=1
    '';
  };

  environment.variables = {
    KWIN_DRM_NO_AMS = "1";
    KWIN_FORCE_SW_CURSOR = "0";
  };

  networking.hostName = "thinkpad";
  system.stateVersion = "23.05";
  powerManagement.cpuFreqGovernor = lib.mkDefault "performance";

  services.syncthing.settings.folders.music_lossy = {
    path = "/home/marcin/Music";
    devices = [ "andromeda" ];
  };

  modules.hardware = {
    external.yubikey.enable = true;
    internal.bluetooth.enable = true;
  };
}
