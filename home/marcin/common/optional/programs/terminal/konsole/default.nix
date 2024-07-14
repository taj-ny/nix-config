{
  programs.plasma.configFile.konsolerc = {
    "Desktop Entry".DefaultProfile.value = "konsole.profile";
    "Notification Messages".CloseAllTabs.value = true;
  };

  home.file = {
    # Breeze with background colors from Krita Dark
    ".local/share/konsole/konsole.colorscheme".source = ./konsole.colorscheme;
    ".local/share/konsole/konsole.profile".source = ./konsole.profile;

    # Why the hell is the toolbar configuration stored in an encoded string?
    ".local/share/konsole/konsolestaterc".source = ./konsolestaterc;
  };
}
