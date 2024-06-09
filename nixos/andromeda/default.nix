{ config, lib, modulesPath, inputs, ... }:

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

    ../common/optional/programs/neovim.nix
    ../common/optional/programs/piper.nix
    ../common/optional/programs/rclone.nix

    ../common/optional/security/u2f-pam.nix

    ../common/optional/services/ssh-agent.nix
    ../common/optional/services/syncthing.nix

    ../common/optional/allow-remote-deployment.nix

    ../common/users/marcin
  ];

  environment = {
    variables.KWIN_FORCE_SW_CURSOR = "1";

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
    fwupd.enable = true;
    power-profiles-daemon.enable = lib.mkForce false;

    syncthing.settings.folders.music_lossy = {
      path = "/home/marcin/Music/lib_opus";
      devices = [ "thinkpad" "rn10pro" ];
    };
  };

  networking.hostName = "andromeda";
  system.stateVersion = "23.05";
  powerManagement.cpuFreqGovernor = lib.mkForce "performance";

  modules = {
    hardware = {
      internal = {
        audio.enable = true;
        bluetooth.enable = true;

        gpu.nvidia.enable = true;
      };

      external.yubikey.enable = true;
    };

    programs = {
      git.enable = true;
      nh.enable = true;
      vmwareWorkstation.enable = true;
    };

    services = {
      mysql.enable = true;
      tor.enable = true;
    };

    network.encryptedDns.enable = true;
  };
}
