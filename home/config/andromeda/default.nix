{
  lib,
  pkgs,
  ...
}:

{
  imports = lib.allExceptThisDefault ./.;

  home = {
    packages = builtins.attrValues {
      inherit (pkgs) spek;
    };
    stateVersion = "23.05";
  };
  persistence.directories = [ ".local/share/Terraria" ];
  programs = {
    clion.enable = true;
    deemix.enable = true;
    nicotine-plus.enable = true;
    rider.enable = true;
    prism-launcher.enable = true;
  };
  wayland.windowManager.hyprland = {
    enable = true;
    settings.monitor = [ "WAYLAND-1,disable "];
  };
}
