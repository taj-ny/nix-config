{
  config,
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
        "plasmashell"
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
    };
    input.keyboard.layouts = [ { layout = "pl"; }];
    kscreenlocker.appearance = {
      inherit wallpaper;
      alwaysShowClock = true;
      showMediaControls = false;
    };
    kwin.virtualDesktops.number = 10;
    overrideConfig = true;
    startup.startupScript = {
      sshAgent.text = ''
        eval $(${pkgs.openssh}/bin/ssh-agent -a $XDG_RUNTIME_DIR/ssh-agent)
      '';

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
    ];
    workspace = {
      inherit wallpaper;
      clickItemTo = "select";
      colorScheme = "KritaDarkOrange";
    };
  };
}
