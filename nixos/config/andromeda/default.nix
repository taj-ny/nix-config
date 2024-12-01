{
  inputs,
  lib,
  ...
}:

{
  imports = [
    inputs.hardware.nixosModules.common-cpu-intel-cpu-only
    inputs.hardware.nixosModules.common-pc
    inputs.hardware.nixosModules.common-pc-ssd

    ../_shared/desktop
    ../_shared/optional/fs/luks-btrfs-impermanence.nix
    ../_shared/optional/hardware/external/printers.nix
    ../_shared/optional/programs/vmware.nix
    ../_shared/optional/security/u2f-pam.nix
    ../_shared/optional/services/syncthing.nix
  ] ++ (lib.allExceptThisDefault ./.);

  custom = {
    hardware = {
      internal = {
        bluetooth.enable = true;
        gpu.nvidia.enable = true;
      };
    };
    impermanence.rootFsSize = "12G";
  };
  environment = {
    etc.crypttab.text = ''
      data PARTLABEL=data /nix/persist/luks_keyfiles/data.key noauto
    '';
    variables.KWIN_DRM_DISABLE_TRIPLE_BUFFERING = "0";
  };
  fileSystems = {
    "/home/marcin/Backups" = {
      device = "/dev/mapper/data";
      fsType = "btrfs";
      options = [ "noatime" "nofail" "noauto" "x-systemd.automount" "subvol=@backups" ];
    };
    "/home/marcin/Music" = {
      device = "/dev/mapper/data";
      fsType = "btrfs";
      options = [ "noatime" "nofail" "noauto" "x-systemd.automount" "subvol=@music" ];
    };
  };
  hardware.nvidia.open = false;
  powerManagement.cpuFreqGovernor = lib.mkForce "performance";
  programs = {
    adb.enable = true;
    kdeconnect.enable = true;
    gamescope.enable = true;
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
  system.stateVersion = "23.05";
}
