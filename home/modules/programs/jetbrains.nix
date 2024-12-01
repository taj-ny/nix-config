{
  lib,
  pkgs,
  ...
}:

{
  imports =
    let
      persistentDirectories = [
        ".config/JetBrains"
        ".java/.userPrefs"
        ".local/share/JetBrains"
      ];
    in
    [
      (lib.mkProgramOption {
        name = "android-studio";
        package = pkgs.android-studio;
        persistentDirectories = [
          ".android"
          "Android"
          ".config/Google"
          ".local/share/Google"
        ] ++ persistentDirectories;
      })
      (lib.mkProgramOption {
        inherit persistentDirectories;
        name = "clion";
        package = pkgs.jetbrains.clion;
      })
      (lib.mkProgramOption {
        inherit persistentDirectories;
        name = "intellij-idea-ultimate";
        package = pkgs.jetbrains.idea-ultimate;
      })
      (lib.mkProgramOption {
        inherit persistentDirectories;
        name = "Rider";
        package = pkgs.jetbrains.rider;
      })
    ];
}
