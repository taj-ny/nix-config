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
    prism-launcher.enable = true;
  };
}
