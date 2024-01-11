{ inputs, pkgs, ... }:

let
  firefox = pkgs.firefox;
in
{
  programs.firefox = {
    enable = true;
    package = firefox;

    policies = {
      CaptivePortal = false;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DisableFirefoxAccounts = true;
      DisableFormHistory = true;
      DontCheckDefaultBrowser = true;
      OfferToSaveLogins = false;
      OfferToSaveLoginsDefault = false;
      PasswordManagerEnabled = false;

      DNSOverHTTPS = {
        Enabled = true;
        ProviderURL = "https://firefox.dns.nextdns.io";
      };

      FirefoxHome = {
        Search = true;
        Pocket = false;
        Snippets = false;
        TopSites = false;
        Highlights = false;
      };

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
      extraConfig = builtins.readFile "${inputs.firefox-ui-fix}/user.js";
      userContent = "@import url(\"firefox-ui-fix/userContent.css\")";

      extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
        clearurls
        darkreader
        keepassxc-browser
        multi-account-containers
        plasma-integration
        sponsorblock
        switchyomega
        tree-style-tab
        ublock-origin
        violentmonkey
      ];

      search = {
        force = true;
        default = "DuckDuckGo";
      };

      bookmarks = [
        {
          name = "Toolbar";
          toolbar = true;
          bookmarks = [
            {
              name = "Home Manager - Option Search";
              keyword = "hm";
              tags = [ "nix" ];
              url = "https://mipmip.github.io/home-manager-option-search";
            }
            {
              name = "NixOS Search";
              keyword = "ns";
              tags = [ "nix" ];
              url = "https://search.nixos.org/packages";
            }
            {
              name = "Noogle";
              keyword = "n";
              tags = [ "nix" ];
              url = "https://noogle.dev";
            }

            {
              name = "Deezer Search";
              tags = [ "piracy" ];
              url = "https://www.deezer.com/asdasdasdasd";
            }
            {
              name = "Divolt";
              keyword = "divolt";
              tags = [ "piracy" ];
              url = "https://divolt.xyz";
            }
            {
              name = "DoubleDouble";
              keyword = "dd";
              tags = [ "piracy" ];
              url = "https://doubledouble.top";
            }
            {
              name = "FMHY";
              keyword = "fmhy";
              tags = [ "piracy" ];
              url = "https://fmhy.pages.dev";
            }

            {
              name = "Discord";
              url = "https://discord.com/app";
            }
            {
              name = "monkeytype";
              keyword = "monkeytype";
              url = "https://monkeytype.com";
            }
            {
              name = "ProtonMail";
              keyword = "mail";
              url = "https://mail.proton.me";
            }
            {
              name = "Spotify";
              keyword = "spotify";
              url = "https://open.spotify.com";
            }
            {
              name = "YouTube";
              keyword = "yt";
              url = "https://youtube.com";
            }
          ];
        }
      ];

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
        "dom.security.https_only_mode" = true;
        "dom.security.https_only_mode_ever_enabled" = true;
        "media.ffmpeg.vaapi.enabled" = true;
        "media.videocontrols.picture-in-picture.video-toggle.enabled" = false;
        "network.trr.mode" = 3;
        "widget.use-xdg-desktop-portal.file-picker" = 1;
      };

      userChrome = ''
        @import url("firefox-ui-fix/userChrome.css");

        html, #urlbar-background {
            background-color: rgba(25, 25, 25, 0.5) !important;
        }

        toolbar, toolbox {
            background-color: transparent !important;
        }

        #nav-bar {
            box-shadow: unset !important;
        }

        #urlbar[focused=true] {
            background-color: rgb(25, 25, 25) !important;
        }

        .tab-background:is([selected], [multiselected]) {
            background-color: rgba(30, 30, 30, 0.75) !important;
        }

        #TabsToolbar #firefox-view-button:hover:not([open]) > .toolbarbutton-icon,
        .tabbrowser-tab:hover > .tab-stack > .tab-background:not([selected], [multiselected]) {
            background-color: rgba(35, 35, 35, 0.75) !important;
        }
      '';
    };
  };

  home = {
    file.".mozilla/firefox/main/chrome/firefox-ui-fix".source = inputs.firefox-ui-fix;
    packages = [
      (pkgs.patchDesktop firefox "firefox" "^Exec=firefox" "Exec=GDK_BACKEND=x11 firefox")
    ];
  };
}
