{ lib, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../common/global

    ../common/optional/desktop/display-manager/lightdm.nix

    ../common/optional/desktop/kde

    ../common/optional/fs/luks-btrfs-impermanence-swapfile.nix

    ../common/users/marcin
  ];

  # TODO This should be optional
  services.syncthing.enable = lib.mkForce false;

  networking.hostName = "vm";
  system.stateVersion = "23.11";
}
