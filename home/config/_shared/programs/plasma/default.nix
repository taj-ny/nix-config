{
  config,
  inputs,
  lib,
  nix-colors,
  pkgs,
  ...
}:

with nix-colors.lib.conversions;
let
  cornerRadius = 15;
  tilingGap = 12;
  forceBlur = [
    "firefox"
    "konsole"
    "plasmashell"
    "yakuake"
  ];
  wallpaper = "${pkgs.plasma-breath-bamboo-wallpaper}/share/wallpapers/Bamboo";
in
{
  imports = lib.allExceptThisDefault ./.;

  custom.programs.plasma.kwin = {
    forceTransparency = {
      opacity = 85;
      windowClasses = [
        "ark"
        "clementine"
        "dolphin"
        "keepassxc"
        "kwrite"
        "org.kde.kate"
        "org.freedesktop.impl.portal.desktop.kde"
        "org.kde.ksshaskpass"
        "org.nicotine_plus.Nicotine"
        "systemsettings"
        "vscodium"
      ];
    };
    reconfigure.effects = [
      "forceblur"
      "kwin4_effect_geometry_change"
      "kwin4_effect_shapecorners"
    ];
  };
  gtk = {
    enable = true;
    theme = {
      name = "Breeze-Dark";
      package = pkgs.kdePackages.breeze-gtk;
    };
  };
  home.packages = lib.attrValues {
    inherit (pkgs)
      kara
      krohnkite;
  };
  programs.plasma = {
    configFile = {
      baloofilerc."Basic Settings".Indexing-Enabled.value = false;
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
      kdeglobals = {
        General = {
          AccentColor.value = lib.strings.concatStringsSep "," (map (x: toString x) (hexToRGB config.colorScheme.palette.accent));
          ColorSchemeHash.value = "null";
        };
        KDE = {
          AnimationDurationFactor.value = "1.414213562373095";
          widgetStyle.value = "Lightly";
        };
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
          FakeBlurImage.value = "${wallpaper}/contents/images/5120x2880.png";
          FakeBlurImageSourceCustom.value = true;
          FakeBlurImageSourceDesktopWallpaper.value = false;
          WindowClasses.value = lib.strings.concatStringsSep "\n" (forceBlur ++ config.custom.programs.plasma.kwin.forceTransparency.windowClasses);
          BlurDecorations.value = true;
          PaintAsTranslucent.value = true;
          TransparentBlur.value = false;
          TopCornerRadius.value = cornerRadius + 2;
          BottomCornerRadius.value = cornerRadius + 2;
          MenuCornerRadius.value = 10;
        };
        Effect-overview.BorderActivate.value = 9;
        ModifierOnlyShortcuts.Meta.value = "";
        Plugins = {
          blurEnabled.value = false;
          contrastEnabled.value = false;
          forceblurEnabled.value = true;
          krohnkiteEnabled.value = true;
          kwin4_effect_geometry_changeEnabled.value = true;
          kwin4_effect_shapecornersEnabled.value = true;
          kwin_effect_lightlyshadersEnabled.value = false;
          lightlyshaders_blurEnabled.value = false;
          shakecursorEnabled.value = false;
          slideEnabled.value = false;
          startupfeedbackEnabled.value = false;
          startupfeedback_busy_cursorEnabled.value = true;
        };
        Script-krohnkite = {
          enableBTreeLayout.value = true;
          enableMonocleLayout.value = false;
          enableSpiralLayout.value = false;
          enableSpreadLayout.value = false;
          enableStairLayout.value = false;
          enableThreeColumnLayout.value = false;
          enableTileLayout.value = false;
          ignoreClass = lib.concatStringsSep "," [
            "kded"
            "krunner"
            "ksshaskpass"
            "org.freedesktop.impl.portal.desktop.kde"
            "org.kde.plasmashell"
            "org.kde.polkit-kde-authentication-agent-1"
            "spectacle"
            "xwaylandvideobridge"
            "yakuake"
          ];
          ignoreTitle = lib.concatStringsSep "," [
            "Configure — System Settings"
          ];
          monocleMaximize.value = false;
          screenGapBottom.value = tilingGap;
          screenGapLeft.value = tilingGap;
          screenGapRight.value = tilingGap;
          screenGapTop.value = tilingGap;
          tileLayoutGap.value = tilingGap;
        };
        Windows = {
          DelayFocusInterval.value = 0;
          FocusPolicy.value = "FocusFollowsMouse";
        };
        Xwayland.XwaylandEavesdrops.value = "None";

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
          InactiveShadowSize.value = 40;
          ShadowSize.value = 40;
          Size.value = cornerRadius;
        };
        SecondOutline = {
          InactiveSecondOutlineThickness.value = 0;
          SecondOutlineThickness.value = 0;
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
      yakuakerc = {
        Appearance.HideSkinBorders.value = true;
        Dialogs.FirstRun.value = false;
        Window = {
          ShowTabBar.value = false;
          ShowTitleBar.value = false;
        };
      };
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
    input.keyboard.layouts = [ { layout = "pl"; }];
    kscreenlocker.appearance = {
      inherit wallpaper;
      alwaysShowClock = true;
      showMediaControls = false;
    };
    kwin.virtualDesktops.number = 10;
    overrideConfig = true;
    panels = [
      {
        height = 29;
        location = "top";
        floating = false; # TODO Breaks Polonium
        widgets = [
          {
            kickoff.icon = "nix-snowflake"; # Used only for the icon, it's better than media frame
          }
          {
            name = "org.dhruv8sh.kara";
            config = {
              general.type = 2;
              type2.fixedLen = 32;
              type3.iconsList = lib.concatStringsSep "\\n" [
                "applications-internet-symbolic"
                "library-music-symbolic"
                "code-context-symbolic"
                "applications-games-symbolic"
              ];
            };
          }
          "org.kde.plasma.panelspacer"
          {
            name = "org.kde.windowtitle";
            config.General = {
              capitalFont = false;
              filterActivityInfo = false;
              useActivityIcon = false;
            };
          }
          "org.kde.plasma.appmenu"
          "org.kde.plasma.panelspacer"
          {
            systemTray.items = {
              hidden = [
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
                "Yakuake"
              ];
              shown = [
                "org.kde.plasma.battery"
                "org.kde.plasma.volume"
                "org.kde.plasma.notifications"
                "org.kde.plasma.networkmanagement"
              ];
            };
          }
          {
            digitalClock = {
              date.enable = false;
              time.showSeconds = "always";
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
              marginRules = "org.kde.plasma.kickoff,1,0|org.kde.windowtitle,1,0|plasmusic-toolbar,0,-15";
              panelPadding = "16";
              panelRealBgOpacity = "0.5";
              panelSpacing = "10";
              radius = "7";
              widgetBgEnabled = "false";
              widgetBgVMargin = "3";
            };
          }
        ];
      }
    ];
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
    startup.startupScript = {
      sshAgent.text = ''
        eval $(${pkgs.openssh}/bin/ssh-agent -a $XDG_RUNTIME_DIR/ssh-agent)
      '';
      yakuake.text = "yakuake &";
    };
    window-rules = [
      {
        description = "Minimum size";
        apply.minsize = {
          apply = "force";
          value = "0,0";
        };
        match.window-types = [ "normal" "dialog" ];
      }
      {
        description = "Yakuake";
        apply = {
          above = {
            apply = "force";
            value = true;
          };
          desktops = {
            apply = "force";
            value = "\\0";
          };
        };
        match.window-class = {
          type = "exact";
          value = "org.kde.yakuake";
        };
      }
    ];
    workspace = {
      inherit wallpaper;
      clickItemTo = "select";
      colorScheme = "KritaDarkOrange";
    };
  };
}
