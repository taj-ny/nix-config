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
      Trip_Temp_C: 85
      cTDP: 0
      Disable_BDPROCHOT: False

      [AC]
      Update_Rate_s: 5
      PL1_Tdp_W: 44
      PL1_Duration_s: 28
      PL2_Tdp_W: 44
      PL2_Duration_S: 0.002
      Trip_Temp_C: 97
      cTDP: 2
      Disable_BDPROCHOT: True

      [UNDERVOLT.BATTERY]
      CORE: -120
      GPU: -100
      CACHE: -100
      UNCORE: 0
      ANALOGIO: 0

      [UNDERVOLT.AC]
      CORE: -170
      GPU: -75
      CACHE: -100
      UNCORE: 0
      ANALOGIO: 0
    '';
  };
}
