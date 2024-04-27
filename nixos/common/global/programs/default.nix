{ pkgs, ... }:

{
  imports = [
    ./git.nix
  ];

  environment.systemPackages = with pkgs; [
    axel # CLI download accelerator
    htop
    powertop
    steam-run
    tmux
    unzip
    vim
    wget
    wl-clipboard
  ];
}
