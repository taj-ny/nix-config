{ pkgs, ... }:

{
  imports = [
    ./git.nix
    ./rclone.nix
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
