{ pkgs, ... }:

{
  imports = [
    ./git.nix
    ./nh.nix
  ];

  environment.systemPackages = with pkgs; [
    bc
    htop
    powertop
    steam-run
    vim
  ];
}
