{
  config,
  inputs,
  lib,
  ...
}:

with lib;
let
  cfg = config.custom.programs.plasma;
in
{
  imports = [
    inputs.plasma-manager.homeManagerModules.plasma-manager
  ] ++ (lib.allExceptThisDefault ./.);

  options.custom.programs.plasma.enable = mkEnableOption "Plasma";

  config = mkIf config.custom.programs.plasma.enable {
    custom.impermanence = {
      persistentDirectories = [
        ".local/share/baloo"
        ".local/share/kwalletd"
        ".local/share/Trash"
      ];

      persistentFiles = [ ".config/kwinoutputconfig.json" ];
    };

    programs.plasma.enable = true;
  };
}
