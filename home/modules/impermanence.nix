{
  lib,
  ...
}:

with lib;
{
  options.custom.impermanence = with types; {
    enable = mkEnableOption "home impermanence";
    persistentDirectories = mkOptionSimpleDefault (listOf str) [ ];
    persistentFiles = mkOptionSimpleDefault (listOf str) [ ];
  };
}
