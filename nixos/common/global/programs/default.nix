{ pkgs, ... }:

{
  imports = [
    ./git.nix
  ];

  environment.systemPackages = with pkgs; [
    htop
    powertop
    steam-run
    tmux
    unzip
    vim
    wget
  ];
}
