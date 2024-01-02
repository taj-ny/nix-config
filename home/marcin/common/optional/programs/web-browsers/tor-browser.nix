{ pkgs, ... }:

{
  home.packages = with pkgs; [
    tor-browser-bundle-bin
    (patchDesktop tor-browser-bundle-bin "torbrowser" "^Exec=tor-browser" "Exec=firejail --profile=${firejail}/etc/firejail/firefox.profile --whitelist=/run/current-system/sw tor-browser")
  ];
}
