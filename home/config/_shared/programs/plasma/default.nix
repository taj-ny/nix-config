{
  config,
  lib,
  nix-colors,
  pkgs,
  ...
}:

with nix-colors.lib.conversions;
{
  imports = lib.allExceptThisDefault ./.;

  gtk = {
    enable = true;
    theme = {
      name = "Breeze-Dark";
      package = pkgs.kdePackages.breeze-gtk;
    };
  };
  home.packages = lib.attrValues {
    inherit (pkgs)
      krohnkite
      kwin-effects-geometry-change
      plasma-panel-colorizer
      plasma-window-title-applet;
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
        KDE.AnimationDurationFactor.value = "1.414213562373095";
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
          Image.value = config.home.wallpaper;
          PreviewImage.value = config.home.wallpaper;
        };
      };
      plasmanotifyrc.Notifications.LowPriorityHistory.value = true;
    };
    input.keyboard.layouts = [ { layout = "pl"; }];
    kscreenlocker.appearance = {
      alwaysShowClock = true;
      showMediaControls = false;
      wallpaper = config.home.wallpaper;
    };
    overrideConfig = true;
    startup.startupScript = {
      sshAgent.text = ''
        eval $(${pkgs.openssh}/bin/ssh-agent -a $XDG_RUNTIME_DIR/ssh-agent)
      '';
    };
    workspace = {
      clickItemTo = "select";
      colorScheme = "KritaDarkOrange";
      wallpaper = config.home.wallpaper;
    };
  };
}
