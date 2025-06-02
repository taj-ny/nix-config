{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:

lib.mkIf config.programs.firefox.enable
{
  persistence.directories = [
    ".mozilla/firefox"
    ".mozilla/native-messaging-hosts"
  ];
  programs.firefox = {
    policies = {
      CaptivePortal = false;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DisableFirefoxAccounts = true;
      DisableFormHistory = true;
      DontCheckDefaultBrowser = true;
      FirefoxHome = {
        Search = true;
        Pocket = false;
        Snippets = false;
        TopSites = false;
        Highlights = false;
      };
      OfferToSaveLogins = false;
      OfferToSaveLoginsDefault = false;
      PasswordManagerEnabled = false;
      UserMessaging = {
        ExtensionRecommendations = false;
        SkipOnboarding = true;
      };
    };
    profiles.main = {
      extensions.packages = with inputs.firefox-addons.packages.${pkgs.system}; [
        keepassxc-browser
        multi-account-containers
        sidebery
        sponsorblock
        stylus
        ublock-origin
        violentmonkey
      ];
      search = {
        force = true;
        default = "ddg";
      };
      settings = {
        "apz.overscroll.enabled" = false;
        "browser.aboutConfig.showWarning" = false;
        "browser.ctrlTab.sortByRecentlyUsed" = true;
        "browser.newtabpage.enabled" = false;
        "browser.search.suggest.enabled" = false;
        "browser.sessionstore.resume_from_crash" = false;
        "browser.startup.homepage" = "chrome://browser/content/blanktab.html";
        "browser.startup.page" = 3;
        "browser.tabs.allow_transparent_browser" = true;
        "browser.tabs.crashReporting.sendReport" = false;
        "browser.tabs.inTitlebar" = 0;
        "browser.toolbars.bookmarks.visibility" = "never";
        "browser.translations.automaticallyPopup" = false;
        "browser.urlbar.suggest.engines" = false;
        "browser.urlbar.suggest.history" = false;
        "browser.urlbar.suggest.topsites" = false;
        "devtools.chrome.enabled" = true;
        "devtools.debugger.remote-enabled" = true;
        "dom.private-attribution.submission.enabled" = false;
        "dom.security.https_only_mode" = true;
        "dom.security.https_only_mode_ever_enabled" = true;
        "extensions.formautofill.creditCards.enabled" = false;
        "full-screen-api.warning.timeout" = 0;
        "media.ffmpeg.vaapi.enabled" = true;
        "media.videocontrols.picture-in-picture.video-toggle.enabled" = false;
        "network.trr.mode" = 5;
        "ui.key.menuAccessKeyFocuses" = false;
        "widget.use-xdg-desktop-portal.file-picker" = 1;
      };
      userChrome = ''
        :root {
          --corner-radius: ${toString config.custom.programs.plasma.kwin.cornerRadius}px;
        }

        ${builtins.readFile ./userChrome.css}
      '';
      userContent = builtins.readFile ./userContent.css;
    };
  };
}
