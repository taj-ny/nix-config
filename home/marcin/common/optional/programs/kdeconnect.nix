{ pkgs, ... }:

{
  services.kdeconnect = {
    enable = true;
    package = pkgs.kdePackages.kdeconnect-kde;
  };

  custom.impermanence.persistentDirectories = [ ".config/kdeconnect" ];
}
