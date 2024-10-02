{
  lib,
  pkgs,
  ...
}:

{
  imports =
    let
      persistentDirectories = [
        ".cache/JetBrains"
        ".config/JetBrains"
        ".java/.userPrefs"
        ".local/share/JetBrains"
      ];
    in
    [
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
