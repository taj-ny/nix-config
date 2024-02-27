{
  boot = {
    kernelParams = [ "quiet" ];

    initrd.systemd.enable = true;
    plymouth.enable = true;
  };
}
