{ inputs, outputs, lib, pkgs, ... }:

let
  patchDesktop = outputs.nixosModules.patchDesktop { inherit lib pkgs; };
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
      userChrome = "@import url(\"firefox-ui-fix/userChrome.css\")";
      userContent = "@import url(\"firefox-ui-fix/userContent.css\")";

      extensions =
        let
          # "nixpkgs.config.allowUnfree = true" in flake.nix doesn't work for firefox-addons for some reason
          mkFree = pkg: pkgs.overrideAttrs (old: {
            meta.license.free = true;
          });
        in
        with inputs.firefox-addons.packages.${pkgs.system}; [
          clearurls
          keepassxc-browser
          plasma-integration
          sponsorblock
          switchyomega
          (mkFree tampermonkey)
          ublock-origin
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
        "browser.startup.homepage" = "chrome://browser/content/blanktab.html";
        "browser.tabs.inTitlebar" = 0;
        "browser.toolbars.bookmarks.visibility" = "never";
        "browser.translations.automaticallyPopup" = false;
        "browser.urlbar.suggest.engines" = false;
        "browser.urlbar.suggest.history" = false;
        "dom.security.https_only_mode" = true;
        "dom.security.https_only_mode_ever_enabled" = true;
        "media.ffmpeg.vaapi.enabled" = true;
        "network.trr.mode" = 3;
        "widget.use-xdg-desktop-portal.file-picker" = 1;
      };
    };
  };

  home = {
    file.".mozilla/firefox/main/chrome/firefox-ui-fix".source = inputs.firefox-ui-fix;
    packages = [
      (patchDesktop firefox "firefox" "^Exec=firefox" "Exec=MOZ_ENABLE_WAYLAND=1 firefox")
    ];
  };
}
