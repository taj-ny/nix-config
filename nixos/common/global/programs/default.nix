{ pkgs, ... }:

{
  imports = [
    ./git.nix
    ./nh.nix
  ];

  environment.systemPackages = with pkgs; [
    axel # CLI download accelerator
    bc
    htop
    powertop
    rsync
    steam-run
    tmux
    unzip
    vim
    wget
    wl-clipboard
  ];
}
