{ inputs, lib, pkgs, ... }:

let
  cornerRadius = 15;
  tilingGap = 12;
  wallpaper = "${pkgs.plasma-breath-wallpapers}/share/wallpapers/Bamboo";

  forceBlur = [
    "firefox"
    "konsole"
    "plasmashell"
  ];

  forceTransparency = [
    "ark"
    "clementine"
    "dolphin"
    "kate"
    "keepassxc"
    "kwrite"
    "org.freedesktop.impl.portal.desktop.kde"
    "org.nicotine_plus.Nicotine"
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

  #home.activation.configure-kwin = lib.hm.dag.entryAfter [ "configure-plasma" ] (
  #  lib.strings.concatStringsSep "\n" (
  #    (map (effect: "${pkgs.kdePackages.qttools}/bin/qdbus org.kde.KWin /Effects org.kde.kwin.Effects.reconfigureEffect ${effect}") kwinEffectsToReconfigure) ++ [
  #      "${pkgs.kdePackages.qttools}/bin/qdbus org.kde.KWin /KWin org.kde.KWin.reconfigure"
  #    ]
  #  )
  #);

  gtk = {
    enable = true;

    theme.name = "Breeze";
  };

  custom.impermanence = {
    persistentDirectories = [
      ".local/share/baloo"
      ".local/share/dolphin"
      ".local/share/kwalletd"
      ".local/share/Trash"
    ];

    persistentFiles = [ ".config/kwinoutputconfig.json" ];
  };

  programs.plasma = {
    enable = true;
    overrideConfig = lib.mkForce false;

    configFile = {
      bluedevilglobalrc.Global.launchState.value = "disable";

      breezerc = {
        Common = {
          OutlineIntensity.value = "OutlineOff";
          ShadowSize.value = "ShadowVeryLarge";
        };

        "Windeco Exception 0" = {
          Enabled.value = true;
          ExceptionPattern.value = ".*";
          ExceptionType.value = 0;
          HideTitleBar.value = true;
        };
      };

      dolphinrc = {
        ContentDisplay = {
          DirectorysizeMode.value = "ContentSize";
          RecursiveDirectorySizeLimit.value = 20;
          UsePermissionsFormat.value = "CombinedFormat";
        };

        General = {
          BrowseThroughArchives.value = true;
          RememberOpenedTabs.value = false;
        };
        
        DetailsMode.PreviewSize.value = 16;
        VersionControl.enabledPlugins.value = "Git";
      };

      katerc = {
        "KTextEditor Renderer"."Color Theme".value = "VSCodium Dark";
      };

      kdeglobals = {
        General = {
          AccentColor.value = "0,150,135";
          #ColorScheme.value = "KritaDarkOrange";
          ColorSchemeHash.value = "null";
        };

        KDE.widgetStyle.value = "Lightly";
      };

      klaunchrc.FeedbackStyle.BusyCursor.value = false;

      klipperrc.General = {
        KeepClipboardContents.value = false; # Don't save across desktop sessions
        MaxClipItems.value = 10000;
      };

      krunnerrc = {
        General = {
          ActivateWhenTypingOnDesktop.value = false;
          FreeFloating.value = true;
        };

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
        "Greeter/LnF/General".showMediaControls.value = false;

        "Greeter/Wallpaper/org.kde.image/General" = {
          Image.value = wallpaper;
          PreviewImage.value = wallpaper;
        };
      };

      kwinrc = {
        Effect-blurplus = {
          BlurStrength.value = 3;
          BlurMenus.value = true;
          NoiseStrength.value = 0;
          FakeBlur.value = true;
          FakeBlurImage.value = "${pkgs.plasma-breath-wallpapers}/share/wallpapers/Bamboo/contents/images/5120x2880.png";
          FakeBlurImageSourceCustom.value = true;
          WindowClasses.value = lib.strings.concatStringsSep "\n" (forceBlur ++ forceTransparency);
          BlurDecorations.value = true;
          PaintAsTranslucent.value = true;
          TransparentBlur.value = false;
          TopCornerRadius.value = cornerRadius + 2;
          BottomCornerRadius.value = cornerRadius + 2;
          MenuCornerRadius.value = 10;
        };

        # Disable top left screen corner
        Effect-overview.BorderActivate.value = 9;

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
          shakecursorEnabled.value = false;
          slideEnabled.value = false;
          startupfeedbackEnabled.value = false;
          startupfeedback_busy_cursorEnabled.value = true;
        };

        Script-polonium = {
          Borders.value = 3;
          FilterProcess.value = lib.strings.concatStringsSep ", " [
            "krunner"
            "kded"
            "polkit"
            "plasmashell"
            "ksshaskpass"
            "org.freedesktop.impl.portal.desktop.kde"
          ];
          InsertionPoint.value = 1;
        };

        Tiling.padding.value = tilingGap;

        Windows = {
          DelayFocusInterval.value = 0;
          FocusPolicy.value = "FocusFollowsMouse";
        };

        # KDE Rounded Corners
        MaximizeTile = {
          DisableOutlineTile.value = false;
          DisableRoundTile.value = false;
        };

        PrimaryOutline = {
          ActiveOutlineUseCustom.value = false;
          ActiveOutlineUsePalette.value = true;
          InactiveOutlineUseCustom.value = false;
          InactiveOutlineUsePalette.value = true;
        };

        "ًRound-Corners" = {
          AnimationEnabled.value = false;
          InactiveCornerRadius.value = cornerRadius;
          InactiveShadowSize.value = 25;
          Size.value = cornerRadius;
        };

        SecondOutline = {
          InactiveSecondOutlineThickness.value = 0;
          SecondOutlineThickness.value = 0;
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
          types.value = 33; # normal, dialog
        };
      };

      kxkbrc.Layout = {
        LayoutList.value = "pl";
        Use.value = true;
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
        key = "Meta+Shift+X";
        command = "systemsettings";
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

    kwin.virtualDesktops.number = 10;

    panels = [
      {
        height = 29;
        location = "top";
        floating = false; # TODO Breaks Polonium
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
            "vmware-tray"
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

    workspace = {
      clickItemTo = "select";
      colorScheme = "KritaDarkOrange";
      #theme = "klassy";
      # colorScheme = "KritaDarkOrange"; Doesn't work
      wallpaper = wallpaper;
    };
  };
}
