{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.custom.programs.google-chrome;
in
{
  options.custom.programs.google-chrome.enable = mkEnableOption "Google Chrome";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      google-chrome
      (patchDesktop google-chrome "google-chrome" "^Exec=${google-chrome}/bin/google-chrome-stable" "Exec=firejail --private ${google-chrome}/bin/google-chrome-stable --incognito")
     ];
  };
}
