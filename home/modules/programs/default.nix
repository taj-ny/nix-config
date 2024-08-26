{
  lib,
  pkgs,
  ...
}:

let
  mkProgramOption = name: package: {
    options.programs.${lib.replaceStrings [ " " ] [ "-" ] (lib.toLower name)}.enable = lib.mkEnableOption name;
    config.home.packages = [ package ];
  };
in
{
  imports = lib.allExceptThisDefault ./.;
} // (lib.mkMergeRecursive [
  (mkProgramOption "Clementine" pkgs.clementine)
  (mkProgramOption "KeepassXC" pkgs.keepassxc)
  (mkProgramOption "Prism Launcher" pkgs.prismlauncher)
])