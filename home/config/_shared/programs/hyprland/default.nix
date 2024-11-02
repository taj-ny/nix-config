{
  lib,
  pkgs,
  ...
}:

{
  imports = (lib.allExceptThisDefault ./.);

  # TODO https://github.com/NixOS/nixpkgs/issues/350514
  home.file."hyprland.sh".text = ''
    export QT_PLUGIN_PATH=$QT_PLUGIN_PATH:${pkgs.lightly-boehs}/lib/qt-5.15.14/plugins:${pkgs.lightly-qt6}/lib/qt-6/plugins:/run/current-system/sw/lib/qt-6/plugins
    export QT_QPA_PLATFORMTHEME=qt5ct
    Hyprland
  '';
  wayland.windowManager.hyprland = {
    settings = {
      "$fileManager" = "dolphin";
      "$musicPlayer" = "clementine";
      "$passwordManager" = "keepassxc";
      "$terminal" = "konsole";
      "$webBrowser" = "firefox";

      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      exec-once = [
        "${pkgs.hyprpaper}/bin/hyprpaper"
      ];

      decoration = {
        rounding = 15;

        active_opacity = 1.0;
        inactive_opacity = 1.0;

        blur = {
          enabled = true;
          size = 3;
          passes = 3;
          vibrancy = 0.1696;
        };
      };

      general = {
        border_size = 1;
        "col.active_border" = "rgb(009688)";
        "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = true;

        gaps_in = 15;
        gaps_out = 15;

        layout = "dwindle";
      };

      misc = {
        disable_hyprland_logo = true;
        force_default_wallpaper = 0;
      };

      bind = [
        "SUPER, Q, killactive,"
        "SUPER, M, exit,"

        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"
        "SUPER, 0, workspace, 10"
        "SUPER SHIFT, 1, movetoworkspace, 1"
        "SUPER SHIFT, 2, movetoworkspace, 2"
        "SUPER SHIFT, 3, movetoworkspace, 3"
        "SUPER SHIFT, 4, movetoworkspace, 4"
        "SUPER SHIFT, 5, movetoworkspace, 5"
        "SUPER SHIFT, 6, movetoworkspace, 6"
        "SUPER SHIFT, 7, movetoworkspace, 7"
        "SUPER SHIFT, 8, movetoworkspace, 8"
        "SUPER SHIFT, 9, movetoworkspace, 9"
        "SUPER SHIFT, 0, movetoworkspace, 10"

        "SUPER SHIFT, RETURN, exec, konsole -e /bin/sh"
        "SUPER SHIFT, C, exec, clementine"
        "SUPER SHIFT, E, exec, /bin/sh -c dolphin"
        "SUPER SHIFT, F, exec, firefox"
        "SUPER SHIFT, T, exec, kwrite"
        "SUPER SHIFT, V, exec, codium"
        "SUPER SHIFT, Z, exec, keepassxc"
      ];
    };
    xwayland.enable = true;
  };
}