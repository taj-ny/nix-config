{ pkgs, ... }:

{
  programs.zsh.enable = true;
  environment.pathsToLink = [ "/share/zsh" ];
}
