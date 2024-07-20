{ config, lib, ... }:

with lib;
let
  cfg = config.custom.programs.plasma;
in
{
  imports = [
    ./kwin
  ];

  options.custom.programs.plasma = {
    enable = mkEnableOption "Plasma";
  };

  config = mkIf config.custom.programs.plasma.enable {
    custom.impermanence = {
      persistentDirectories = [
        ".local/share/baloo"
        ".local/share/dolphin"
        ".local/share/kwalletd"
        ".local/share/Trash"
      ];

      persistentFiles = [ ".config/kwinoutputconfig.json" ];
    };

    programs.plasma.enable = true;
  };
}
