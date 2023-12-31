{ lib, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../common/global

    ../common/optional/fs/luks-btrfs-impermanence-swapfile.nix

    ../common/users/marcin
  ];

  # TODO This should be optional
  services.syncthing.enable = lib.mkForce false;

  networking.hostName = "vm";
  system.stateVersion = "23.11";
}
