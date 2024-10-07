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
    deemix.enable = true;
    nicotine-plus.enable = true;
    rider.enable = true;
    prism-launcher.enable = true;
  };
}
