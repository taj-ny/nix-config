{
  lib,
  inputs,
  ...
}:

{
  imports = [
    inputs.hardware.nixosModules.common-cpu-intel-cpu-only
    inputs.hardware.nixosModules.common-pc
    inputs.hardware.nixosModules.common-pc-ssd

    ../_shared/optional/desktop/kde

    ../_shared/optional/fs/luks-btrfs-impermanence.nix

    ../_shared/optional/hardware/external/printers.nix

    #../_shared/optional/programs/vmware.nix

    ../_shared/optional/security/u2f-pam.nix

    ../_shared/optional/services/pipewire.nix
    ../_shared/optional/services/syncthing.nix
    ../_shared/optional/services/tor.nix

    ../_shared/optional/allow-remote-deployment.nix
    ../_shared/optional/encrypted-dns.nix
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
  };
  fileSystems."/home/marcin/Music" = {
    device = "/dev/mapper/data";
    fsType = "btrfs";
    options = [ "noatime" "nofail" "noauto" "x-systemd.automount" "subvol=@music" ];
  };
  powerManagement.cpuFreqGovernor = lib.mkForce "performance";
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
  system.stateVersion = "23.05";
}
