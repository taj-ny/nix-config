{ pkgs, ... }:

{
  imports = [
    ./_config.nix
  ];

  home = {
    packages = with pkgs; [ easyeffects ];
    
    file.".config/autostart/easyeffects-service.desktop".text = ''
      [Desktop Entry]
      Name=Easy Effects
      Comment=Easy Effects Service
      Exec=easyeffects --gapplication-service
      Icon=com.github.wwmm.easyeffects
      StartupNotify=false
      Terminal=false
      Type=Application
    '';
  };
}
