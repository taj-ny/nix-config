{
  config,
  lib,
  ...
}:

lib.mkIf config.programs.yakuake.enable
{
  programs.plasma = {
    configFile.yakuakerc = {
      Appearance.HideSkinBorders.value = true;
      Dialogs.FirstRun.value = false;
      Window = {
        ShowTabBar.value = false;
        ShowTitleBar.value = false;
      };
    };
    startup.yakuake.text = "yakuake &";
    window-rules = [
      {
        description = "Yakuake";
        apply = {
          above = {
            apply = "force";
            value = true;
          };
          desktops = {
            apply = "force";
            value = "\\0";
          };
        };
        match.window-class = {
          type = "exact";
          value = "org.kde.yakuake";
        };
      }
    ];
  };
}