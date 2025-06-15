{
  inputs,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    inputs.hardware.nixosModules.lenovo-thinkpad-t480

    ../_shared/desktop
    ../_shared/optional/fs/luks-btrfs-impermanence-swapfile.nix
    ../_shared/optional/services/syncthing.nix
    ../_shared/optional/security/u2f-pam.nix
  ] ++ (lib.allExceptThisDefault ./.);

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [ "resume_offset=53848001" ];
  };
  custom = {
    hardware.internal.bluetooth.enable = true;
    impermanence.rootFsSize = "8G";
    security.secureBoot.enable = true;
  };
  environment = {
    systemPackages = [ inputs.inputactions.packages.${pkgs.system}.default ];
    variables.KWIN_FORCE_SW_CURSOR = "0";
  };
  programs = {
    adb.enable = true;
    kdeconnect.enable = true;
    gamescope.enable = true;
    partition-manager.enable = true;
    steam.enable = true;

    weylus = {
      enable = true;
      users = [ "marcin" ];
    };
  };
  services = {
    power-profiles-daemon.enable = lib.mkForce false;
    syncthing.settings.folders.music_lossy = {
      path = "/home/marcin/Music";
      devices = [ "andromeda" ];
    };
  };
  system.stateVersion = "23.05";
  virtualisation.podman.enable = true;

  services.udev.packages = [
    (pkgs.writeTextFile {
      name = "71-touchpad.rules";
      text = ''
        ENV{ID_INPUT_TOUCHPAD}=="1", TAG+="uaccess"
      '';
      destination = "/etc/udev/rules.d/71-touchpad.rules";
    })
  ];
}
