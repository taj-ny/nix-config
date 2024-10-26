{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    inputs.hardware.nixosModules.lenovo-thinkpad-t480

    ../_shared/optional/desktop/unlock-after-hibernation.nix
    ../_shared/optional/desktop/kde

    ../_shared/optional/fs/luks-btrfs-impermanence-swapfile.nix

    ../_shared/optional/services/pipewire.nix
    ../_shared/optional/services/syncthing.nix
    ../_shared/optional/services/tor.nix

    ../_shared/optional/security/u2f-pam.nix

    ../_shared/optional/allow-remote-deployment.nix
    ../_shared/optional/encrypted-dns.nix
  ] ++ (lib.allExceptThisDefault ./.);

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
  environment.variables.KWIN_FORCE_SW_CURSOR = "0";
  nix.settings = {
    substituters = lib.mkBefore [ "http://andromeda:${toString config.services.nix-serve.port}" ];
    trusted-public-keys = [ "andromeda:RKWnCuVLtIChwcxy6ti8u8SH+9ye2peaSlrTjVRQiCk=" ];
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
    flatpak.enable = true;
  };
  system.stateVersion = "23.05";
  powerManagement.cpuFreqGovernor = lib.mkForce "performance";
}
