{ pkgs, ... }:

{
  home.packages = with pkgs; [ python311Packages.deemix ];
}
