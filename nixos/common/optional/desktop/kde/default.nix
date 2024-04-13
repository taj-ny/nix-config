{ inputs, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    excludePackages = with pkgs; [ xterm ];

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

        klassy

        # Plasmoids
        paneltransparencybutton
        plasma-panel-colorizer
        plasma-panel-spacer-extended

        # Desktop effects
        inputs.kwin-effects-forceblur.packages.${pkgs.system}.default
        lightlyshaders
      ];

    plasma6.excludePackages = with pkgs.kdePackages; [
      elisa
    ];

    # Better performance and no input lag on Wayland
    variables.KWIN_DRM_NO_AMS = "1";
  };

  # Required for GTK configuration
  programs.dconf.enable = true;
}
