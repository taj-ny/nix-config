{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    corefonts
    meslo-lgs-nf
    noto-fonts
    noto-fonts-emoji
    liberation_ttf
  ];

  environment.systemPackages = with pkgs; [ fontconfig ];
}
