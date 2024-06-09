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

    ../common/optional/programs/neovim.nix
    ../common/optional/programs/piper.nix
    ../common/optional/programs/rclone.nix

    ../common/optional/services/ssh-agent.nix
    ../common/optional/services/syncthing.nix

    ../common/optional/security/secure-boot.nix
    ../common/optional/security/u2f-pam.nix

    ../common/optional/allow-remote-deployment.nix

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

  programs = {
    kdeconnect.enable = true;
    partition-manager.enable = true;
    steam.enable = true;
  };

  services = {
    fwupd.enable = true;

    syncthing.settings.folders.music_lossy = {
      path = "/home/marcin/Music";
      devices = [ "andromeda" ];
    };
  };

  modules = {
    hardware = {
      internal = {
        audio.enable = true;
        bluetooth.enable = true;
      };

      external.yubikey.enable = true;
    };

    programs = {
      git.enable = true;
      #vmwareWorkstation.enable = true; TODO Broken
    };

    services = {
      mysql.enable = true;
      tor.enable = true;
    };

    network.encryptedDns.enable = true;

    fs.layout = {
      predefined = true;
      withLuks = true;
      withSwap = true;
    };
  };
}
