{
  boot = {
    kernel.sysctl."fs.file-max" = 524288;
    kernelParams = [
      "kernel.sysrq=244"
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
