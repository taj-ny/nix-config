{
  inputs,
  pkgs,
  ...
}:

{
  services = {
    xserver = {
      enable = true;
      excludePackages = with pkgs; [ xterm ];
    };

    displayManager.sddm = {
      enable = true;

      wayland = {
        enable = true;
        compositor = "kwin";
      };
    };

    desktopManager.plasma6.enable = true;
  };

  environment = {
    systemPackages =
      with pkgs;
      with kdePackages; [
        # Application styles
        lightly-boehs
        lightly-qt6

        # KWin scripts
        polonium

        # Wallpapers
        plasma-breath-bamboo-wallpaper

        # Plasmoids
        plasma-panel-colorizer
        plasma-window-title-applet

        # Desktop effects
        inputs.kwin-effects-forceblur.packages.${pkgs.system}.default
        inputs.kwin-effects-startupfeedback-busy-cursor.packages.${pkgs.system}.default
        kde-rounded-corners
        kwin-effects-geometry-change
      ];

    plasma6.excludePackages = with pkgs.kdePackages; [
      elisa
      kate
    ];
  };
}
