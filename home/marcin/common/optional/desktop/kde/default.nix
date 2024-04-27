{ inputs, lib, pkgs, ... }:

let
  wallpaper = "${pkgs.plasma-breath-wallpapers}/share/wallpapers/Bamboo";

  forceTransparency = [
    "ark"
    "clementine"
    "dolphin"
    "kate"
    "keepassxc"
    "konsole"
    "kwrite"
    "systemsettings"
  ];

  kwinEffectsToReconfigure = [
    "forceblur"
    "kwin4_effect_geometry_change"
    "kwin4_effect_shapecorners"
  ];
in
{
  imports = [
    inputs.plasma-manager.homeManagerModules.plasma-manager
  ];

  home.activation.configure-kwin = lib.hm.dag.entryAfter [ "configure-plasma" ] (
    lib.strings.concatStringsSep "\n" (
      (map (effect: "${pkgs.kdePackages.qttools}/bin/qdbus org.kde.KWin /Effects org.kde.kwin.Effects.reconfigureEffect ${effect}") kwinEffectsToReconfigure) ++ [
        "${pkgs.kdePackages.qttools}/bin/qdbus org.kde.KWin /KWin org.kde.KWin.reconfigure"
      ]
    )
  );

  programs.plasma = {
    enable = true;

    configFile = {
      breezerc = {
        Common = {
          OutlineIntensity.value = "OutlineOff";
          ShadowSize.value = "ShadowNone";
        };

        "Windeco Exception 0" = {
          Enabled.value = true;
          ExceptionPattern.value = ".*";
          ExceptionType.value = 0;
          HideTitleBar.value = true;
        };
      };

      kdeglobals = {
        General = { 
          AccentColor.value = "0,150,136";
          ColorScheme.value = "KritaDarkOrange";
          ColorSchemeHask.value = "null";
        };

        KDE.widgetStyle.value = "Lightly";
      };

      "klassy/klassyrc".Style = {
        ButtonGradient.value = true;
        MenuOpacity.value = 50;
      };

      klipperrc.General = {
        KeepClipboardContents.value = false; # Don't save across desktop sessions
        MaxClipItems.value = 10000;
      };

      krunnerrc = {
        General.FreeFloating.value = true;
        Plugins = {
          baloosearchEnabled.value = false;
          recentdocumentsEnabled.value = false;
        };
      };

      ksmserverrc.General.loginMode.value = "emptySession";

      ksplashrc.KSplash = {
        Engine.value = "none";
        Theme.value = "None";
      };

      kscreenlockerrc = {
        Daemon.LockGrace.value = 0; # Doesn't work with u2f
        "Greeter/Wallpaper/org.kde.image/General" = {
          Image.value = wallpaper;
          PreviewImage.value = wallpaper;
        };
      };

      kwinrc = {
        Effect-blurplus = {
          BlurStrength.value = 6;
          NoiseStrength.value = 0;
          FakeBlur.value = true;
          FakeBlurImage.value = "${pkgs.plasma-breath-wallpapers}/share/wallpapers/Bamboo/contents/images/1920x1080_blurred.png";
          WindowClasses.value = lib.strings.concatStringsSep "\n" ([
            "plasmashell"
            "firefox"
          ] ++ forceTransparency);
          BlurDecorations.value = true;
          PaintAsTranslucent.value = true;
          TopCornerRadius.value = 10;
          BottomCornerRadius.value = 10;
        };

        # The first dash is not actually a dash for some reason
        "Effect-ًRound-Corners" = {
          ActiveOutlineUseCustom.value = false;
          ActiveOutlineUsePalette.value = true;
          ActiveShadowAlpha.value = 125;
          DisableOutlineMaximize.value = true;
          DisableOutlineTile.value = false;
          DisableRoundMaximize.value = true;
          DisableRoundTile.value = false;
          ExcludeMaximizedWindows.value = false;
          InactiveOutlineUseCustom.value = false;
          InactiveOutlineUsePalette.value = true;
          InactiveShadowAlpha.value = 125;
          InactiveShadowSize.value = 30;
          ShadowSize.value = 30;
        };

        ModifierOnlyShortcuts.Meta.value = "";

        Plugins = {
          blurEnabled.value = false;
          contrastEnabled.value = false;
          forceblurEnabled.value = true;
          kwin4_effect_geometry_changeEnabled.value = true;
          kwin4_effect_shapecornersEnabled.value = true;
          kwin_effect_lightlyshadersEnabled.value = false;
          lightlyshaders_blurEnabled.value = false;
          poloniumEnabled.value = true;
          slideEnabled.value = false;
        };

        Script-polonium = {
          FilterProcess.value = lib.strings.concatStringsSep ", " [
            "krunner"
            "kded"
            "polkit"
            "plasmashell"
            "ksshaskpass"
          ];
          InsertionPoint.value = 1;
        };

        Tiling.padding.value = 12;

        Windows = {
          DelayFocusInterval.value = 0;
          FocusPolicy.value = "FocusFollowsMouse";
        };
      };

      kwinrulesrc = {
        General = {
          count.value = 2;
          rules.value = "50946d8d-701f-4424-9260-136605110dc8,eb1e7304-4128-427a-8022-37c814070998";
        };

        "50946d8d-701f-4424-9260-136605110dc8" = {
          Description.value = "Force transparency";
          opacityactive.value = 85;
          opacityactiverule.value = 2;
          opacityinactive.value = 85;
          opacityinactiverule.value = 2;
          wmclass.value = lib.strings.concatStringsSep "|" forceTransparency;
          wmclassmatch.value = 3;
        };

        eb1e7304-4128-427a-8022-37c814070998 = {
          Description.value = "Minimum size";
          minsizerule.value = 2;
        };
      };

      lightlyrc = {
        Common.CornerRadius.value = 8;

        Style = {
          DolphinSidebarOpacity.value = 50;
          MenuOpacity.value = 80;
          TabDrawHighlight.value = true;
        };         
      };

      plasmanotifyrc.Notifications.LowPriorityHistory.value = true;
    };

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

      launch-kate = {
        name = "Launch Kate";
        key = "Meta+Shift+T";
        command = "kate";
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
        key= "Meta+Shift+X";
        command = "systemsettings";
      };
    };

    kwin.virtualDesktops.number = 10;

    panels = [
      {
        height = 29;
        location = "top";
        floating = true;
        widgets = [
          {
            name = "org.kde.plasma.kickoff";
            config.General = {
              alphaSort = "true";
              compactMode = "true";
              favoritesDisplay = "true";
              icon = "nix-snowflake";
              primaryActions = "3";
              showActionButtonCaptions = "false";
              systemFavorites = "lock-screen\\\\,logout\\\\,save-session\\\\,switch-user\\\\,suspend\\\\,hibernate\\\\,reboot\\\\,shutdown";
            };
          }
          {
            name = "org.kde.windowtitle";
            config.General = {
              capitalFont = "false";
              useActivityIcon = "false";
            };
          }
          "org.kde.plasma.appmenu"
          "org.kde.plasma.panelspacer"
          "org.kde.plasma.systemtray"
          {
            name = "org.kde.plasma.digitalclock";
            config.Appearance = {
              showDate = "false";
              showSeconds = "Always";
            };
          }
          {
            name = "luisbocanegra.panel.colorizer";
            config.General = {
              colorMode = "1";
              colorModeTheme = "9";
              enableCustomPadding = "true";
              fgColorMode = "1";
              fgContrastFixEnabled = "false";
              fgLightness = "0.55";
              hideWidget = "true";
              marginRules = "org.kde.plasma.kickoff,1,0|org.kde.windowtitle,1,0";
              panelPadding = "16";
              panelRealBgOpacity = "0.5";
              panelSpacing = "10";
              radius = "7";
              widgetBgEnabled = "false";
              widgetBgVMargin = "3";
            };
          }
        ];

        extraSettings = lib.readFile (pkgs.substituteAll {
          src = ./system-tray.js;

          shownItems = lib.strings.concatStringsSep "," [ 
            "org.kde.plasma.battery"
            "org.kde.plasma.volume"
            "org.kde.plasma.notifications"
            "org.kde.plasma.networkmanagement"
          ];

          hiddenItems = lib.strings.concatStringsSep "," [
            "Clementine"
            "org.kde.plasma.brightness"
            "org.kde.plasma.cameraindicator"
            "org.kde.kscreen"
            "org.kde.kdeconnect"
            "org.kde.plasma.keyboardlayout"
            "org.kde.plasma.keyboardindicator"
            "org.kde.plasma.manage-inputmethod"
            "org.kde.plasma.mediacontroller"
          ];
        });
      }
    ];

    shortcuts = {
      kwin = {
        Overview = "none";
        PoloniumFocusAbove = "Meta+W";
        PoloniumFocusLeft = "Meta+A";
        PoloniumFocusBelow = "Meta+S";
        PoloniumFocusRight = "Meta+D";
        PoloniumInsertAbove = "Meta+Shift+W";
        PoloniumInsertLeft = "Meta+Shift+A";
        PoloniumInsertBelow = "Meta+Shift+S";
        PoloniumInsertRight = "Meta+Shift+D";
        PoloniumRetileWindow = "Meta+Space";
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
        "manage activities" = "none";
        "next activity" = "none";
        "previous activity" = "none";
        "stop current activity" = "none";
      };

      "services/org.kde.dolphin.desktop"."_launch" = "Meta+Shift+E";
      "services/org.kde.krunner.desktop"."_launch" = "Meta+X";
      "services/org.kde.spectacle.desktop"."_launch" = "Print";
    };

    workspace = {
      clickItemTo = "select";
      theme = "klassy";
      # colorScheme = "KritaDarkOrange"; Doesn't work
      wallpaper = wallpaper;
    };
  };
}
