{ outputs, ... }:

{
  imports = [
    outputs.homeManagerModules.kde

    ./nixpkgs.nix
    ./xdg.nix
  ];

  home = {
    username = "marcin";
    homeDirectory = "/home/marcin";
  };

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
