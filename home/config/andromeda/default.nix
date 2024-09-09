{
  lib,
  pkgs,
  ...
}:

{
  imports = lib.allExceptThisDefault ./.;

  custom = {
    impermanence.persistentDirectories = [ ".local/share/Terraria" ];
    programs = {
      clion.enable = true;
      nicotine-plus.enable = true;
      rider.enable = true;
    };
  };
  home = {
    packages = builtins.attrValues {
      inherit (pkgs) spek;
    };
    stateVersion = "23.05";
  };
  programs = {
    deemix.enable = true;
    prism-launcher.enable = true;
  };
}
