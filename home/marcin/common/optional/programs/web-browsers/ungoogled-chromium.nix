{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ungoogled-chromium
    (patchDesktop ungoogled-chromium "chromium-browser" "^Exec=chromium" "Exec=firejail --profile=${firejail}/etc/firejail/chromium-browser-privacy.profile ${ungoogled-chromium}/bin/chromium --incognito")
  ];
}
