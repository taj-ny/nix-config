{ lib, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_hardened;
  services.throttled.enable = lib.mkForce false;
}
