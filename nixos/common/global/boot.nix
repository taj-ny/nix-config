{
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot = {
      enable = true;
      editor = false;
      configurationLimit = 10;
    };

   # grub = {
   #   enable = true;
   #   efiSupport = true;
   #   device = "nodev";
   # };
  };
}
