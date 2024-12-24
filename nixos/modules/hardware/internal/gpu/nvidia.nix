{
  config,
  lib,
  ...
}:

with lib;
let
  cfg = config.custom.hardware.internal.gpu.nvidia;
in
{
  options.custom.hardware.internal.gpu.nvidia.enable = mkEnableOption "Nvidia";

  config = mkIf cfg.enable {
    boot = {
      kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
      kernelParams = [ "nvidia_drm.modeset=1" ];
    };
    hardware.nvidia = {
      modesetting.enable = true;
      nvidiaSettings = false;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
      powerManagement.enable = true;
    };
    services.xserver.videoDrivers = [ "nvidia" ];
  };
}
