{
  pkgs,
  ...
}:

{
  programs.plasma = {
    hotkeys.commands = {
      launch-clementine = {
        name = "Launch Clementine";
        key = "Meta+Shift+C";
        command = "clementine";
      };
      launch-firefox = {
        name = "Launch Firefox";
        key = "Meta+Shift+F";
        command = "firefox";
      };
      launch-keepassxc = {
        name = "Launch KeepassXC";
        key = "Meta+Shift+Z";
        command = "keepassxc";
      };
      launch-konsole = {
        name = "Launch Konsole";
        key = "Meta+Shift+Return";
        command = "konsole";
      };
      launch-system-settings = {
        name = "Launch System Settings";
        key = "Meta+Shift+X";
        command = "systemsettings";
      };
      launch-vscode = {
        name = "Launch VSCode";
        key = "Meta+Shift+V";
        command = "codium";
      };
      logout = {
        name = "Log out";
        key = "Ctrl+Shift+Meta+Alt+L";
        command = "${pkgs.kdePackages.qttools}/bin/qdbus org.kde.Shutdown /Shutdown org.kde.Shutdown.logout";
      };
      hibernate = {
        name = "Hibernate";
        key = "Ctrl+Shift+Meta+Alt+H";
        command = "systemctl hibernate";
      };
      poweroff = {
        name = "Poweroff";
        key = "Ctrl+Shift+Meta+Alt+P";
        command = "systemctl poweroff";
      };
      reboot = {
        name = "Reboot";
        key = "Ctrl+Shift+Meta+Alt+R";
        command = "systemctl reboot";
      };
      suspend = {
        name = "Suspend";
        key = "Ctrl+Shift+Meta+Alt+S";
        command = "systemctl suspend";
      };
    };
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