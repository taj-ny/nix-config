{
  lib,
  ...
}:

{
  home.file.".config/qt6ct/qt6ct.conf".text = lib.generators.toINI { } {
    Appearance = {
      icon_theme = "breeze-dark";
      style = "Lightly";
    };

    Fonts = {
      fixed = "Hack,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,Regular";
      general = "Noto Sans,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "Lightly";
  };
}