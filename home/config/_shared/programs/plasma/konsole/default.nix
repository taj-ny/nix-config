{
  imports = [ ./colors.nix ];

  home.file = {
    # Breeze with background colors from Krita Dark
    # ".local/share/konsole/konsole.colorscheme".source = ./konsole.colorscheme;
    ".local/share/konsole/konsole.profile".source = ./konsole.profile;
  };
  programs.plasma.configFile.konsolerc = {
    "Desktop Entry".DefaultProfile.value = "konsole.profile";
    # Why the hell is the toolbar configuration stored like this?
    MainWindow.State = "AAAA/wAAAAD9AAAAAQAAAAAAAAAAAAAAAPwCAAAAAvsAAAAiAFEAdQBpAGMAawBDAG8AbQBtAGEAbgBkAHMARABvAGMAawAAAAAA/////wAAAXIA////+wAAABwAUwBTAEgATQBhAG4AYQBnAGUAcgBEAG8AYwBrAAAAAAD/////AAABEQD///8AAAdoAAAEAwAAAAQAAAAEAAAACAAAAAj8AAAAAQAAAAIAAAACAAAAFgBtAGEAaQBuAFQAbwBvAGwAQgBhAHIAAAAAAP////8AAAAAAAAAAAAAABwAcwBlAHMAcwBpAG8AbgBUAG8AbwBsAGIAYQByAAAAAAD/////AAAAAAAAAAA=";
    "Notification Messages".CloseAllTabs.value = true;
  };
}
