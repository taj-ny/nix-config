{
  boot.loader = {
    systemd-boot = {
      enable = true;
      editor = false;
      configurationLimit = 10;
    };

    efi.canTouchEfiVariables = true;
  };
}
