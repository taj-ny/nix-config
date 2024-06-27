{ inputs, outputs, pkgs, ... }:

let
  username = "marcin";
in
{
  imports = [
    ./nixos-update-notifier.nix
    ./nix.nix
    ./xdg.nix

    "${inputs.impermanence}/home-manager.nix"
  ] ++ (builtins.attrValues outputs.homeManagerModules);

  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    packages = with pkgs; [
      gimp
      keepassxc
      libreoffice-fresh
      obs-studio
      vlc
    ];
  };

  custom.impermanence.enable = true;

  fonts.fontconfig.enable = true;
  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";
}
