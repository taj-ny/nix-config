{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ rclone ];
}