{ inputs, pkgs, ... }:

let
  wallpaper = "${pkgs.plasma-workspace-wallpapers}/share/wallpapers/Canopee";
in
{
  imports = [
    inputs.plasma-manager.homeManagerModules.plasma-manager
  ];

  programs.plasma = {
    enable = true;

    configFile = {
      kdeglobals.General.AccentColor.value = "0,150,136";

      "klassy/klassyrc".Style = {
        ButtonGradient.value = true;
        MenuOpacity.value = 50;
      };

      klipperrc.General = {
        KeepClipboardContents.value = false; # Don't save across desktop sessions
        MaxClipItems.value = 1000;
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
          WindowClasses.value = ''
            plasmashell
            konsole
            firefox
          '';
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
          DisableOutlineTile.value = false;
          DisableRoundTile.value = false;
          ExcludeMaximizedWindows.value = false;
          InactiveOutlineUseCustom.value = false;
          InactiveOutlineUsePalette.value = true;
          InactiveShadowAlpha.value = 125;
          InactiveShadowSize.value = 30;
          ShadowSize.value = 30;
        };

        Plugins = {
          blurEnabled.value = false;
          contrastEnabled.value = false;
          forceblurEnabled.value = false;
          kwin4_effect_shapecornersEnabled.value = true;
          kwin_effect_lightlyshadersEnabled.value = false;
          lightlyshaders_blurEnabled.value = false;
          poloniumEnabled.value = true;
          slideEnabled.value = false;
        };

        Tiling.padding.value = 12;
      };

      kwinrulesrc = {
        General = {
          count.value = 1;
          rules.value = "f257328a-0fca-420c-8e09-78e6e5f33053";
        };

        f257328a-0fca-420c-8e09-78e6e5f33053 = {
          Description.value = "Disable titlebar and border";
          noborder.value = true;
          noborderrule.value = 2;
        };
      };

      plasmanotifyrc.Notifications.LowPriorityHistory.value = true;
    };

    kwin.virtualDesktops.number = 8;

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
          "luisbocanegra.panelspacer.extended"
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
      }
    ];

    workspace = {
      clickItemTo = "select";
      theme = "klassy";
      colorScheme = "KritaDarkOrange";
      wallpaper = wallpaper;
    };
  };
}
