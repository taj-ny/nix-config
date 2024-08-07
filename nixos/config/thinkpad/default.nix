{
  inputs,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    inputs.hardware.nixosModules.lenovo-thinkpad-t480
    ./hardware-configuration.nix

    ./throttled.nix

    ../common/optional/desktop/unlock-after-hibernation.nix
    ../common/optional/desktop/kde

    ../common/optional/fs/luks-btrfs-impermanence-swapfile.nix

    ../common/optional/services/pipewire.nix
    ../common/optional/services/syncthing.nix
    ../common/optional/services/tor.nix

    ../common/optional/security/u2f-pam.nix

    ../common/optional/allow-remote-deployment.nix
    ../common/optional/encrypted-dns.nix
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [ "resume_offset=53848001" ];
    extraModprobeConfig = ''
      options thinkpad_acpi fan_control=1
    '';
  };

  custom = {
    hardware.internal.bluetooth.enable = true;
    impermanence.rootFsSize = "8G";
    security.secureBoot.enable = true;
  };

  programs = {
    kdeconnect.enable = true;
    partition-manager.enable = true;
    steam.enable = true;
  };

  services = {
    syncthing.settings.folders.music_lossy = {
      path = "/home/marcin/Music";
      devices = [ "andromeda" ];
    };
  };

  environment.variables = {
    KWIN_DRM_NO_AMS = "1";
    KWIN_FORCE_SW_CURSOR = "0";
  };

  system.stateVersion = "23.05";
  powerManagement.cpuFreqGovernor = lib.mkDefault "performance";
}
