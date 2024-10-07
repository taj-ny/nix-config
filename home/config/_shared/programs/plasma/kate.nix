{
  programs.plasma.configFile = {
    kwriterc = {
      General = {
        "Auto Hide Tabs".value = false;
        "Show welcome view for new window".value = false;
      };
      "KTextEditor Renderer" = {
        "Auto Color Theme Selection".value = false;
        "Color Theme".value = "VSCodium Dark";
      };
      "KTextEditor View" = {
        "Show Line Count".value = true;
        "Show Word Count".value = true;
      };
    };
  };
}