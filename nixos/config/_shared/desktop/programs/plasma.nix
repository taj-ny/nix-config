{
  inputs,
  pkgs,
  ...
}:

{
  environment = {
    systemPackages = (builtins.attrValues {
      inherit (pkgs)
        kde-rounded-corners
        klassy;
    }) ++ [
      inputs.kwin-better-blur.packages.${pkgs.system}.default
      inputs.kwin-effects-startupfeedback-busy-cursor.packages.${pkgs.system}.default
      inputs.darkly.packages.${pkgs.system}.darkly-qt5
      inputs.darkly.packages.${pkgs.system}.darkly-qt6
    ];
    plasma6.excludePackages = builtins.attrValues {
      inherit (pkgs.kdePackages)
        elisa;
    };
  };
  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm = {
      enable = true;
      wayland = {
        enable = true;
        compositor = "kwin";
      };
    };
    xserver = {
      enable = true;
      excludePackages = [ pkgs.xterm ];
    };
  };
}
