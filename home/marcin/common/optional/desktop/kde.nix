{ pkgs, ... }:

let
  mkWidget = name: config: { inherit name config; };
  mkPanel = height: widgets: { inherit height widgets; };
  mkSpacer = length: mkWidget "org.kde.plasma.panelspacer" {
    General = {
      inherit length;
      expanding = false;
    };
  };

  wallpaper = "${pkgs.plasma-workspace-wallpapers}/share/wallpapers/Kay";
in
{
  home.packages = with pkgs; [
    klassy
    lightly-boehs
  ];

  desktop.kde = {
    appearance = {
      wallpaper.image = wallpaper;

      layout.panels = [
        (mkPanel 38 ([
          (mkSpacer 1)
          (mkWidget "org.kde.plasma.kickoff" {
            General = {
              alphaSort = true;
              compactMode = true;
              favoritesDisplay = true;
              icon = "nix-snowflake";
              primaryActions = 3;
              showActionButtonCaptions = false;
              systemFavorites = "lock-screen\\\\,logout\\\\,save-session\\\\,switch-user\\\\,suspend\\\\,hibernate\\\\,reboot\\\\,shutdown";
            };
          })
          (mkSpacer 1)
          (mkWidget "org.kde.plasma.activitypager" {})
          (mkWidget "org.kde.plasma.icontasks" {
            General.launchers = "";
          })
          (mkWidget "org.kde.plasma.panelspacer" { General.expanding = true; })
          (mkWidget "org.kde.plasma.systemtray" {
            General = {
              iconSpacing = 1;
              shownItems = "org.kde.plasma.battery";
            };
          })
          (mkSpacer 3)
          (mkWidget "org.kde.plasma.digitalclock" {
            Appearance = {
              dateFormat = "isoDate";
              showSeconds = true;
              use24hFormat = true;
            };
          })
          (mkWidget "org.kde.paneltransparencybutton" {
            "Configuration -> Appearance".transparencyEnabled = true;
          })
          (mkSpacer 3)
        ]))
      ];

      gtk.useBreezeTheme = true;
    };

    configs = {
      kdeglobals = {
        KDE.widgetStyle = "lightly";

        General = {
          AccentColor = "0,150,136";
          ColorScheme = "KritaDarkOrange";
          ColorSchemeHash = null;
        };
      };

      klipperrc.General = {
        KeepClipboardContents = false;
        MaxClipItems = 1000;
      };

      krunnerrc = {
        General.FreeFloating = true;

        Plugins = {
          baloosearchEnabled = false;
          recentdocumentsEnabled = false;
        };
      };

      ksmserverrc.General.loginMode = "emptySession";

      ksplashrc.KSplash = {
        Engine = "none";
        Theme = "None";
      };

      klassyrc = {
        Common = {
          ActiveTitlebarOpacity = 50;
          ButtonIconStyle = "StyleRedmond";
          InactiveTitlebarOpacity = 50;
        };

        Windeco = {
          CornerRadius = 2;
          DrawBackgroundGradient = true;
          IntegratedRoundedRectangleBottomPadding = 0;
          OpaqueMaximizedTitlebars = false;
        };
      };

      kscreenlockerrc = {
        Daemon.LockGrace = 0; # Doesn't work well with u2f - black screen, process has to be killed in order to unlock

        "Greeter -> Wallpaper -> org.kde.image -> General" = {
          Image = wallpaper;
          PreviewImage = wallpaper;
        };
      };

      lightlyrc.Style = {
        DolphinSidebarOpacity = 40;
        MenuOpacity = 40;
        TabDrawHighlight = true;
      };

      kwinrc = {
        "org.kde.kdecoration2" = {
          ButtonsOnLeft = "MSF";
          library = "org.kde.klassy";
          theme = "Klassy";
        };

        Plugins = {
          contrastEnabled = false;
        };
      };
    };
  };
}
