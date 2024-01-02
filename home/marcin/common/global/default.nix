{ outputs, ... }:

{
  imports = [
    ./nixpkgs.nix
    ./xdg.nix
  ] ++ (builtins.attrValues outputs.homeManagerModules);

  home = {
    username = "marcin";
    homeDirectory = "/home/marcin";
  };

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
