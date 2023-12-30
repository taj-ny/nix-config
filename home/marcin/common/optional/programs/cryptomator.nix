{ pkgs, ... }:

{
  home.packages = with pkgs; [ cryptomator ];
}
