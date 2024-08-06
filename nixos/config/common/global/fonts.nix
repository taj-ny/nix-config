{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    corefonts
    noto-fonts
    noto-fonts-emoji
    liberation_ttf
  ];

  environment.systemPackages = with pkgs; [ fontconfig ];
}
