{
  lib,
  ...
}:

with lib;
{
  options.custom.impermanence = with types; {
    enable = mkEnableOption "home impermanence";
    persistentDirectories = mkOptionSimpleDefault (listOf anything) [ ];
    persistentFiles = mkOptionSimpleDefault (listOf anything) [ ];
  };
}
