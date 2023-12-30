{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ piper ];
  services.ratbagd.enable = true;
}