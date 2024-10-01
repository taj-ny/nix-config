{
  lib,
  pkgs,
  ...
}:

{
  imports = lib.allExceptThisDefault ./.;

  custom.impermanence.persistentDirectories = [ ".local/share/Terraria" ];
  home = {
    packages = builtins.attrValues {
      inherit (pkgs) spek;
    };
    stateVersion = "23.05";
  };
  programs = {
    deemix.enable = true;
    nicotine-plus.enable = true;
    prism-launcher.enable = true;
  };
}
