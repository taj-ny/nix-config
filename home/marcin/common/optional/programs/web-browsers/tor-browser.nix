{ outputs, lib, pkgs, ... }:

let
  patchDesktop = outputs.nixosModules.patchDesktop { inherit lib pkgs; };
in
{
  home.packages = with pkgs; [
    tor-browser-bundle-bin
    (patchDesktop tor-browser-bundle-bin "torbrowser" "^Exec=tor-browser" "Exec=firejail --profile=${firejail}/etc/firejail/firefox.profile --whitelist=/run/current-system/sw tor-browser")
  ];
}
