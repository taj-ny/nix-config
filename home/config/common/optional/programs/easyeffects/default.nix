{ pkgs, ... }:

{
  imports = [
    ./_config.nix
  ];

  services.easyeffects.enable = true;
}
