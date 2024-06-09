{ pkgs, ... }:

{
  imports = [
    ./nh.nix
  ];

  environment.systemPackages = with pkgs; [
    axel # CLI download accelerator
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
