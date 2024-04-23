{
  programs.plasma.configFile.konsolerc."Desktop Entry".DefaultProfile.value = "konsole.profile";

  home.file = {
    # Breeze with background colors from Krita Dark
    ".local/share/konsole/konsole.colorscheme".source = ./konsole.colorscheme;
    ".local/share/konsole/konsole.profile".source = ./konsole.profile;
  };
}
