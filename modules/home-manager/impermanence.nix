{ config, lib, ... }:

with lib;
let 
  cfg = config.custom.impermanence;
in
{
  options.custom.impermanence = with types; {
    enable = mkEnableOption "home impermanence";

    persistentDirectories = mkOption {
      default = [];
      type = listOf anything;
    };

    persistentFiles = mkOption {
      default = [];
      type = listOf anything;
    };
  };

  config.home.persistence."/nix/persist/home/${config.home.username}" = mkIf cfg.enable {
    allowOther = true;

    directories = 
      let
        symlink = directory: {
          inherit directory;
          method = "symlink";
        };
      in
      [
        ".cert" # NetworkManager OpenVPN
        ".config/JetBrains"
        ".java/.userPrefs"
        ".local/share/JetBrains"
        (symlink ".local/share/Steam")
        ".ssh"
        ".syncthing"
        "Documents"
        "Downloads"
        "Pictures"
        "Projects"
        "Virtual Machines"
      ] ++ (cfg.persistentDirectories);

    files = [
      ".config/rclone/rclone.conf"
    ] ++ (cfg.persistentFiles);
  };
}
