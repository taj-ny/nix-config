{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    excludePackages = with pkgs; [ xterm ];

    desktopManager.plasma5.enable = true;
  };

  environment = {
    systemPackages =
      with pkgs;
      with plasma5Packages; [
        kate
        ark
        kcalc
        krita
        plasma-browser-integration

        paneltransparencybutton
      ];

    plasma5.excludePackages = with pkgs.libsForQt5; [
      elisa
    ];

    # Better performance and no input lag on Wayland
    variables.KWIN_DRM_NO_AMS = "1";
  };

  # Required for GTK configuration
  programs.dconf.enable = true;
}
