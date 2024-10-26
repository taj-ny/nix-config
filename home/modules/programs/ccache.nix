{
  lib,
  pkgs,
  ...
}:

lib.mkProgramOption {
  name = "Ccache";
  package = pkgs.ccache;
  persistentDirectories = [ ".cache/ccache" ];
  customConfig.home.sessionVariables.CMAKE_CXX_COMPILER_LAUNCHER = "ccache";
}