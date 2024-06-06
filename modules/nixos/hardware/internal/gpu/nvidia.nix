{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.modules.hardware.internal.gpu.nvidia;
in
{
  options.modules.hardware.internal.gpu.nvidia.enable = mkEnableOption "Nvidia support";

  config = mkIf cfg.enable {
    boot = {
      kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
      kernelParams = [ "nvidia_drm.modeset=1" ];
    };

    hardware.nvidia = {
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.production;

      modesetting.enable = true;
      powerManagement.enable = true;
    };

    services.xserver.videoDrivers = [ "nvidia" ];
  };
}
