let
  maxTemperature = 97;

  undervolt = {
    ac = {
      core = 100;
      cache = 50;
      gpu = 0;
    };

    battery = {
      core = 100;
      cache = 100;
      gpu = 50;
    };
  };
in
{
  services.throttled = {
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
      Trip_Temp_C: ${toString maxTemperature}
      cTDP: 0
      Disable_BDPROCHOT: true

      [AC]
      Update_Rate_s: 5
      PL1_Tdp_W: 44
      PL1_Duration_s: 28
      PL2_Tdp_W: 44
      PL2_Duration_S: 0.002
      Trip_Temp_C: ${toString maxTemperature}
      cTDP: 2
      Disable_BDPROCHOT: True

      [UNDERVOLT.BATTERY]
      CORE: ${toString (undervolt.battery.core * -1)}
      GPU: ${toString (undervolt.battery.gpu * -1)}
      CACHE: ${toString (undervolt.battery.cache * -1)}
      UNCORE: 0
      ANALOGIO: 0

      [UNDERVOLT.AC]
      CORE: ${toString (undervolt.ac.core * -1)}
      GPU: ${toString (undervolt.ac.gpu * -1)}
      CACHE: ${toString (undervolt.ac.cache * -1)}
      UNCORE: 0
      ANALOGIO: 0
    '';
  };
}
