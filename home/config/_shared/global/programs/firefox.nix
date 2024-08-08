{
  inputs,
  pkgs,
  ...
}:

{
  home.file.".mozilla/firefox/main/chrome/firefox-ui-fix".source = inputs.firefox-ui-fix;
  programs.firefox = {
    policies = {
      CaptivePortal = false;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DisableFirefoxAccounts = true;
      DisableFormHistory = true;
      DNSOverHTTPS = {
        Enabled = true;
        ProviderURL = "https://firefox.dns.nextdns.io";
      };
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
      SanitizeOnShutdown = {
        Cache = true;
        Cookies = false;
        Downloads = true;
        FormData = true;
        History = true;
        Sessions = false;
        SiteSettings = false;
        OfflineApps = false;
      };
      UserMessaging = {
        ExtensionRecommendations = false;
        SkipOnboarding = true;
      };
    };
    profiles.main = {
      extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
        keepassxc-browser
        multi-account-containers
        sponsorblock
        switchyomega
        ublock-origin
        violentmonkey
      ];
      extraConfig = builtins.readFile "${inputs.firefox-ui-fix}/user.js";
      search = {
        force = true;
        default = "DuckDuckGo";
      };
      settings = {
        "browser.aboutConfig.showWarning" = false;
        "browser.newtabpage.enabled" = false;
        "browser.search.suggest.enabled" = false;
        "browser.sessionstore.resume_from_crash" = false;
        "browser.startup.homepage" = "chrome://browser/content/blanktab.html";
        "browser.tabs.inTitlebar" = 0;
        "browser.toolbars.bookmarks.visibility" = "never";
        "browser.translations.automaticallyPopup" = false;
        "browser.urlbar.suggest.engines" = false;
        "browser.urlbar.suggest.history" = false;
        "browser.urlbar.suggest.topsites" = false;
        "dom.private-attribution.submission.enabled" = false;
        "dom.security.https_only_mode" = true;
        "dom.security.https_only_mode_ever_enabled" = true;
        "media.ffmpeg.vaapi.enabled" = true;
        "media.videocontrols.picture-in-picture.video-toggle.enabled" = false;
        "network.trr.mode" = 3;
        "widget.use-xdg-desktop-portal.file-picker" = 1;
      };
      # chrome://browser/content/browser.xhtml
      userChrome = ''
        @import url("firefox-ui-fix/userChrome.css");

        html, #urlbar #urlbar-background {
            background-color: rgba(25, 25, 25, 0.5) !important;
        }

        toolbar, toolbox {
            background-color: transparent !important;
        }

        #nav-bar {
            box-shadow: unset !important;
            border-top: unset !important;
        }

        #urlbar[focused=""] #urlbar-background {
            background-color: rgb(25, 25, 25) !important;
        }

        #nav-bar,
        .tab-background:is([selected], [multiselected]) {
            background-color: transparent !important;
        }

        #TabsToolbar #firefox-view-button:hover:not([open]) > .toolbarbutton-icon,
        .tabbrowser-tab:hover > .tab-stack > .tab-background:not([selected], [multiselected]) {
            background-color: transparent !important;
        }
      '';
      userContent = "@import url(\"firefox-ui-fix/userContent.css\")";
    };
  };
}
