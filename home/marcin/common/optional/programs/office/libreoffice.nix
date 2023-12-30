{ pkgs, ... }:

{
  home.packages = with pkgs; [ libreoffice-fresh ];
}
