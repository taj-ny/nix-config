{
  config,
  lib,
  ...
}:

lib.mkIf config.programs.deemix.enable
{
  custom.impermanence.persistentFiles = [ ".config/deemix/.arl" ];
}