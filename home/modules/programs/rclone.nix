{
  lib,
  pkgs,
  ...
}:

lib.mkProgramOption {
  name = "Rclone";
  package = pkgs.rclone;
  persistentDirectories = [ ".config/rclone" ];
}