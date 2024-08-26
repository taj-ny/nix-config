{
  lib,
  ...
}:

{
  imports = lib.allExceptThisDefault ./.;

  custom.programs = {
    clion.enable = true;
    deemix.enable = true;
    nicotine-plus.enable = true;
    rider.enable = true;
  };
  home = {
    stateVersion = "23.05";
    sessionVariables.MOZ_ENABLE_WAYLAND = 0; # TODO Remove when 130 is out
  };
  programs.prism-launcher.enable = true;
}
