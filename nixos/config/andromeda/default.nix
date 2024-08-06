{ config, lib, modulesPath, inputs, pkgs, ... }:

{
  imports = [
    inputs.hardware.nixosModules.common-cpu-intel-cpu-only
    inputs.hardware.nixosModules.common-pc
    inputs.hardware.nixosModules.common-pc-ssd
    ./hardware-configuration.nix

    ../common/global

    ../common/optional/desktop/display-manager/sddm.nix
 
    ../common/optional/desktop/kde

    ../common/optional/fs/luks-btrfs-impermanence.nix

    ../common/optional/hardware/external/printers.nix
    ../common/optional/hardware/external/yubikey.nix

    ../common/optional/hardware/internal/bluetooth.nix

    #../common/optional/programs/adb.nix
    #../common/optional/programs/kdeconnect.nix
    #../common/optional/programs/neovim.nix
    ../common/optional/programs/piper.nix
    #../common/optional/programs/rclone.nix
    #../common/optional/programs/steam.nix
    ../common/optional/programs/vmware.nix

    ../common/optional/security/u2f-pam.nix

    ../common/optional/services/fwupd.nix
    ../common/optional/services/pipewire.nix
    ../common/optional/services/ssh-agent.nix
    ../common/optional/services/syncthing.nix
    ../common/optional/services/tor.nix

    ../common/optional/allow-remote-deployment.nix
    ../common/optional/encrypted-dns.nix

    ../common/users/marcin
  ];

  custom = {
    hardware = {
      internal.gpu.nvidia.enable = true;
    };
  };

  environment = {
    etc.crypttab.text = ''
      data PARTLABEL=data /nix/persist/luks_keyfiles/data.key noauto
    '';
  };

  fileSystems."/home/marcin/Music" = {
    device = "/dev/mapper/data";
    fsType = "btrfs";
    options = [ "noatime" "nofail" "noauto" "x-systemd.automount" "subvol=@music" ];
  };

  programs = {
    adb.enable = true;
    kdeconnect.enable = true;
    partition-manager.enable = true;
    steam.enable = true;
  };

  services = {
    power-profiles-daemon.enable = lib.mkForce false;

    syncthing.settings.folders.music_lossy = {
      path = "/home/marcin/Music/lib_opus";
      devices = [ "thinkpad" "rn10pro" ];
    };
  };

  networking.hostName = "andromeda";
  system.stateVersion = "23.05";
  powerManagement.cpuFreqGovernor = lib.mkForce "performance";
}
