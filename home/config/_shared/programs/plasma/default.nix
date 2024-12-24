{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = lib.allExceptThisDefault ./.;

  gtk = {
    enable = true;
    theme = {
      name = "Breeze-Dark";
      package = pkgs.kdePackages.breeze-gtk;
    };
  };
  programs.plasma = {
    configFile = {
      baloofilerc."Basic Settings".Indexing-Enabled.value = false;
      bluedevilglobalrc.Global.launchState.value = "disable";
      kdeglobals = {
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
      wallpaper = config.home.wallpaper;
    };
  };
}
