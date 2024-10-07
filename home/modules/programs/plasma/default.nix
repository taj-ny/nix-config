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
    persistence = {
      directories = [
        ".config/krdp-serverrc"
        ".config/krdpserverrc"
        ".local/share/baloo"
        ".local/share/krdpserver"
        ".local/share/kwalletd"
        ".local/share/Trash"
      ];
      files = [ ".config/kwinoutputconfig.json" ];
    };
    programs.plasma.enable = true;
  };
}
