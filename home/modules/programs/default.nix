{
  lib,
  pkgs,
  ...
}:

let
  mkProgramOption = name: package: {
    options.programs.${lib.toLower name}.enable = lib.mkEnableOption name;
    config.home.packages = [ package ];
  };
in
{
  imports = lib.allExceptThisDefault ./.;
}
// (mkProgramOption "KeepassXC" pkgs.keepassxc)
