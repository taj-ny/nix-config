{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ thefuck ];
  programs.zsh.enable = true;
  environment.pathsToLink = [ "/share/zsh" ];
}
