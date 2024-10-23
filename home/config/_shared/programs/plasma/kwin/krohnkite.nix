{
  lib,
  ...
}:

let
  tilingGap = 15;
in
{
  programs.plasma.configFile.kwinrc = {
    Script-krohnkite = {
      enableBTreeLayout.value = true;
      enableColumnsLayout.value = false;
      enableMonocleLayout.value = false;
      enableSpiralLayout.value = false;
      enableSpreadLayout.value = false;
      enableStairLayout.value = false;
      enableThreeColumnLayout.value = false;
      enableTileLayout.value = false;
      ignoreClass = lib.concatStringsSep "," [
        "kded"
        "krunner"
        "ksshaskpass"
        "org.freedesktop.impl.portal.desktop.kde"
        "org.kde.plasmashell"
        "org.kde.polkit-kde-authentication-agent-1"
        "qalculate-qt"
        "spectacle"
        "xwaylandvideobridge"
        "yakuake"
      ];
      ignoreTitle = lib.concatStringsSep "," [
        "Configure — System Settings"
      ];
      monocleMaximize.value = false;
      screenGapBottom.value = tilingGap;
      screenGapLeft.value = tilingGap;
      screenGapRight.value = tilingGap;
      screenGapTop.value = tilingGap;
      tileLayoutGap.value = tilingGap;
    };
    Plugins.krohnkiteEnabled.value = true;
  };
}