{
  home.file = {
    "Downloads/.directory".text = ''
      [Dolphin]
      GroupedSorting=true
      SortFoldersFirst=false
      SortOrder=1
      SortRole=modificationtime
      ViewMode=1
    '';
    ".local/share/dolphin/view_properties/global/.directory".text = ''
      [Dolphin]
      Version=4
      ViewMode=1
      VisibleRoles=CustomizedDetails,Details_text,Details_size,Details_modificationtime

      [Settings]
      HiddenFilesShown=true
    '';
  };
  programs.plasma.configFile.dolphinrc = {
    ContentDisplay = {
      DirectorysizeMode.value = "ContentSize";
      RecursiveDirectorySizeLimit.value = 20;
      UsePermissionsFormat.value = "CombinedFormat";
    };
    DetailsMode.PreviewSize.value = 16;
    General = {
      BrowseThroughArchives.value = true;
      GlobalViewProps.value = false;
      RememberOpenedTabs.value = false;
    };
    VersionControl.enabledPlugins.value = "Git";
  };
}