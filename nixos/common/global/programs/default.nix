{ pkgs, ... }:

{
  imports = [
    ./git.nix
    ./rclone.nix
  ];

  environment.systemPackages = with pkgs; [
    btop
    htop
    powertop
    steam-run
    tmux
    unzip
    vim
    wget
  ];
}
