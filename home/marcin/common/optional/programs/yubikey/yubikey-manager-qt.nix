{ pkgs, ... }:

{
  home.packages = with pkgs; [ yubikey-manager-qt ];
}
