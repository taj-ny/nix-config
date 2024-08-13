{
  boot = {
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernel.sysctl."fs.file-max" = 524288;
    kernelParams = [
      "kernel.sysrq=244"
      "quiet"
      "udev.log_level=3"
    ];
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
        editor = false;
      };
    };
  };
}
