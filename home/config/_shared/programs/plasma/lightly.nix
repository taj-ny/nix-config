{
  pkgs,
  ...
}:

{
  # For some reason the styles stopped being detected
  # TODO The Qt5 one may break
  home.file.".config/plasma-workspace/env/path.sh".text = ''
    export QT_PLUGIN_PATH=$QT_PLUGIN_PATH:${pkgs.lightly-boehs}/lib/qt-5.15.14/plugins:${pkgs.lightly-qt6}/lib/qt-6/plugins
  '';
  programs.plasma.configFile = {
    kdeglobals.KDE.widgetStyle.value = "Lightly";
    lightlyrc = {
      Common.CornerRadius.value = 8;
      Style = {
        DolphinSidebarOpacity.value = 50;
        MenuOpacity.value = 80;
        TabDrawHighlight.value = true;
      };
    };
  };
}