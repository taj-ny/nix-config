{
  lib,
  pkgs,
  ...
}:

let
  shortcuts = {
    "Ctrl+Shift+Meta+Alt+L" = "${pkgs.kdePackages.qttools}/bin/qdbus org.kde.Shutdown /Shutdown org.kde.Shutdown.logout";
    "Ctrl+Shift+Meta+Alt+H" = "systemctl hibernate";
    "Ctrl+Shift+Meta+Alt+P" = "systemctl poweroff";
    "Ctrl+Shift+Meta+Alt+R" = "systemctl reboot";
    "Ctrl+Shift+Meta+Alt+S" = "systemctl suspend";
    "Meta+Shift+C" = "clementine";
    "Meta+Shift+F" = "firefox";
    "Meta+Shift+Return" = "konsole";
    "Meta+Shift+T" = "kwrite";
    "Meta+Shift+V" = "codium";
    "Meta+Shift+X" = "systemsettings";
    "Meta+Shift+Z" = "keepassxc";
  };
in
{
  programs.plasma = {
    hotkeys.commands =
      lib.mapAttrs'
        (name: value:
          lib.nameValuePair
            (lib.replaceStrings [ "+" ] [ "" ] name)
            {
              command = value;
              key = name;
            }
        )
        shortcuts;
    shortcuts = {
      kwin = {
        KrohnkiteFocusDown = "Meta+S";
        KrohnkiteFocusLeft = "Meta+A";
        KrohnkiteFocusRight = "Meta+D";
        KrohnkiteFocusUp = "Meta+W";
        KrohnkiteShiftDown = "Meta+Shift+S";
        KrohnkiteShiftLeft = "Meta+Shift+A";
        KrohnkiteShiftRight = "Meta+Shift+D";
        KrohnkiteShiftUp = "Meta+Shift+W";
        KrohnkiteToggleFloat = "Meta+Space";
        Overview = "none";
        "Show Desktop" = "none";
        "Switch to Desktop 1" = "Meta+1";
        "Switch to Desktop 2" = "Meta+2";
        "Switch to Desktop 3" = "Meta+3";
        "Switch to Desktop 4" = "Meta+4";
        "Switch to Desktop 5" = "Meta+5";
        "Switch to Desktop 6" = "Meta+6";
        "Switch to Desktop 7" = "Meta+7";
        "Switch to Desktop 8" = "Meta+8";
        "Switch to Desktop 9" = "Meta+9";
        "Switch to Desktop 10" = "Meta+0";
        "Window Close" = "Meta+Q";
        "Window Fullscreen" = "Meta+F";
        "Window to Desktop 1" = "Meta+!";
        "Window to Desktop 2" = "Meta+@";
        "Window to Desktop 3" = "Meta+#";
        "Window to Desktop 4" = "Meta+$";
        "Window to Desktop 5" = "Meta+%";
        "Window to Desktop 6" = "Meta+^";
        "Window to Desktop 7" = "Meta+&";
        "Window to Desktop 8" = "Meta+*";
        "Window to Desktop 9" = "Meta+(";
        "Window to Desktop 10" = "Meta+)";
      };
      plasmashell = {
        "activate application launcher" = "none";
        "manage activities" = "none";
        "next activity" = "none";
        "previous activity" = "none";
        "stop current activity" = "none";
      };
      "services/org.kde.dolphin.desktop"."_launch" = "Meta+Shift+E";
      "services/org.kde.krunner.desktop"."_launch" = "Meta+X";
      "services/org.kde.spectacle.desktop"."_launch" = "Print";
    };
  };
}