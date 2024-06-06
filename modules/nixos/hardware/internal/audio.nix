{ config, lib, ... }:

with lib;
let
  cfg = config.modules.hardware.internal.audio;
in
{
  options.modules.hardware.internal.audio.enable = mkEnableOption "Audio support";

  config = mkIf cfg.enable {
    services.pipewire = {
      enable = true;

      alsa = {
        enable = true;
        support32Bit = true;
      };

      pulse.enable = true;
    };

    security.rtkit.enable = true;
  };
}
