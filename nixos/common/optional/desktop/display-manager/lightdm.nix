{
  # Using LightDM because sddm doesn't work when using autologin + wayland as the default session
  services.xserver.displayManager.lightdm.enable = true;
}
