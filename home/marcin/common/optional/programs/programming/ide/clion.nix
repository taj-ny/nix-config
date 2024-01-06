{ pkgs, ... }:

{
  # TODO Patch .desktop for steam-run
  home.packages = with pkgs; [
    jetbrains.clion

    cmake
    gcc
  ];
}
