{ pkgs, ... }:

{
  # TODO Patch .desktop for steam-run
  home.packages = with pkgs; [
    jetbrains.phpstorm

    php
  ];
}
