{ inputs, pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      excludePackages = with pkgs; [ xterm ];
    };

    desktopManager.plasma6.enable = true;
  };

  environment = {
    systemPackages =
      with pkgs;
      with kdePackages; [
        kate
        ark
        kcalc
        krita
        plasma-browser-integration

        # Application styles
        lightly-boehs
        lightly-qt6

        # Window decorations
        klassy

        # KWin scripts
        polonium

        # Wallpapers
        plasma-breath-wallpapers

        # Plasmoids
        plasma-panel-colorizer
        plasma-panel-spacer-extended
        plasma-window-title-applet

        # Desktop effects
        inputs.kwin-effects-forceblur.packages.${pkgs.system}.default
        inputs.kwin-effects-startupfeedback-busy-cursor.packages.${pkgs.system}.default
        kde-rounded-corners
        kwin-effects-geometry-change
        lightlyshaders
      ];

    plasma6.excludePackages = with pkgs.kdePackages; [
      elisa
    ];
  };

  # Required for GTK configuration
  programs.dconf.enable = true;
}
