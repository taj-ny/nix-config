{
  services.displayManager.sddm = {
    enable = true;
    
    wayland = {
      enable = true;
      compositor = "kwin";
    };
  };
}
