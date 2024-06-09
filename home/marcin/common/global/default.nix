{ outputs, ... }:

{
  imports = [
    ./impermanence.nix
    ./nixos-update-notifier.nix
    ./nix.nix
    ./xdg.nix
  ] ++ (builtins.attrValues outputs.homeManagerModules);

  home = {
    username = "marcin";
    homeDirectory = "/home/marcin";
  };

  fonts.fontconfig.enable = true;

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
