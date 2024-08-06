{
  boot = {
    consoleLogLevel = 0;
    kernelParams = [ "quiet" "udev.log_level=3" ];

    loader = {
      systemd-boot = {
        enable = true;
        editor = false;
        configurationLimit = 10;
      };

      efi.canTouchEfiVariables = true;
    };

    kernel.sysctl."fs.file-max" = 524288;
    initrd.verbose = false;
  };
}
