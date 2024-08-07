{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.custom.services.throttled;
in
{
  options.custom.services.throttled =
    with types;
    let
      generalType.options = {
        disableBdProchot = mkOptionSimpleDefault bool false;
        maxTemperature = mkOptionSimpleDefault int 75;
      };

      undervoltType.options = {
        analogio = mkOptionSimpleDefault int 0;
        cache = mkOptionSimpleDefault int 0;
        core = mkOptionSimpleDefault int 0;
        gpu = mkOptionSimpleDefault int 0;
        uncore = mkOptionSimpleDefault int 0;
      };
    in
    {
      enable = mkEnableOption "throttled";

      general = {
        ac = mkOptionSimpleDefault (submodule generalType) { };
        battery = mkOptionSimpleDefault (submodule generalType) { };
      };

      undervolt = {
        ac = mkOptionSimpleDefault (submodule undervoltType) { };
        battery = mkOptionSimpleDefault (submodule undervoltType) { };
      };
    };

  config.services.throttled = mkIf cfg.enable {
    enable = true;

    extraConfig = ''
      [GENERAL]
      Enabled: True
      Sysfs_Power_Path: /sys/class/power_supply/AC*/online
      Autoreload: True

      [BATTERY]
      Update_Rate_s: 30
      PL1_Tdp_W: 29
      PL1_Duration_s: 28
      PL2_Tdp_W: 44
      PL2_Duration_S: 0.002
      Trip_Temp_C: ${toString cfg.general.battery.maxTemperature}
      cTDP: 0
      Disable_BDPROCHOT: ${toString cfg.general.battery.disableBdProchot}

      [AC]
      Update_Rate_s: 5
      PL1_Tdp_W: 44
      PL1_Duration_s: 28
      PL2_Tdp_W: 44
      PL2_Duration_S: 0.002
      Trip_Temp_C: ${toString cfg.general.ac.maxTemperature}
      cTDP: 2
      Disable_BDPROCHOT: ${toString cfg.general.ac.disableBdProchot}

      [UNDERVOLT.BATTERY]
      CORE: ${toString (cfg.undervolt.battery.core * -1)}
      GPU: ${toString (cfg.undervolt.battery.gpu * -1)}
      CACHE: ${toString (cfg.undervolt.battery.cache * -1)}
      UNCORE: ${toString (cfg.undervolt.battery.uncore * -1)}
      ANALOGIO: ${toString (cfg.undervolt.battery.analogio * -1)}

      [UNDERVOLT.AC]
      CORE: ${toString (cfg.undervolt.ac.core * -1)}
      GPU: ${toString (cfg.undervolt.ac.gpu * -1)}
      CACHE: ${toString (cfg.undervolt.ac.cache * -1)}
      UNCORE: ${toString (cfg.undervolt.ac.uncore * -1)}
      ANALOGIO: ${toString (cfg.undervolt.ac.analogio * -1)}
    '';
  };
}