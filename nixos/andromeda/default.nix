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

    ../common/optional/hardware/external/printers.nix

    ../common/optional/programs/neovim.nix
    ../common/optional/programs/piper.nix
    ../common/optional/programs/rclone.nix

    ../common/optional/services/ssh-agent.nix
    ../common/optional/services/syncthing.nix

    ../common/optional/allow-remote-deployment.nix

    ../common/users/marcin
  ];

  programs = {
    adb.enable = true;
    kdeconnect.enable = true;
    partition-manager.enable = true;
    steam.enable = true;
  };

  services = {
    fwupd.enable = true;

    syncthing.settings.folders.music_lossy = {
      path = "/home/marcin/Music/lib_opus";
      devices = [ "thinkpad" "rn10pro" ];
    };
  };

  modules = {
    fs = {
      layout = {
        predefined = true;
        withLuks = true;
      };

      extraDevices."data" = {
        keyFile = "/persist/luks_keyfiles/data.key";

        subvolumes."@music" = "/home/marcin/Music";
      };
    };

    hardware = {
      internal = {
        audio.enable = true;
        bluetooth.enable = true;

        gpu.nvidia.enable = true;
      };

      external.yubikey.enable = true;
    };

    nixos = {
      deviceType = "pc";
      kernel = "lts"; # Nvidia moment

      impermanence.rootSize = 16;
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
    security.pam-u2f.enable = true;
  };

  networking.hostName = "andromeda";
  system.stateVersion = "23.05";

  environment.variables.KWIN_FORCE_SW_CURSOR = "1";
}
