{
  programs.plasma.configFile.konsolerc."Desktop Entry".DefaultProfile.value = "konsole.profile";

  home.file = {
    # Breeze with background colors from Krita Dark
    ".local/share/konsole/konsole.colorscheme".source = ./konsole.colorscheme;
    ".local/share/konsole/konsole.profile".source = ./konsole.profile;

    # Someone had a brilliant idea that the toolbar configuration should be stored in an encoded string. I don't even
    # know what's encoded in there, I just launched Konsole in a sandbox, disabled toolbars, closed it and copied the
    # file. I love KDE.
    ".local/share/konsole/konsolestaterc".source = ./konsolestaterc;
  };
}
