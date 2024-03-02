{ pkgs, ... }:

{
  dconf.settings = {
    "com/github/wwmm/easyeffects/streamoutputs".plugins = [ "crystalizer#0" "bass_enhancer#0" "crossfeed#0" ];

    "com/github/wwmm/easyeffects/streamoutputs/bassenhancer/0" = {
      amount = 2.0;
      output-gain = -2.5;
    };

    "com/github/wwmm/easyeffects/streamoutputs/crossfeed/0" = {
      fcut = 700;
      feed = 4.5;
    };
  };

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
