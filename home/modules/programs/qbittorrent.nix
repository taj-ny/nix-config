{
  lib,
  pkgs,
  ...
}:

lib.mkProgramOption {
  name = "qBittorrent";
  package = pkgs.qbittorrent;
  persistentDirectories = [
    ".config/qBittorrent"
    ".local/share/qBittorrent"
  ];
}