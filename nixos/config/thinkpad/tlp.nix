{
  services.tlp = {
    enable = true;
    settings = {
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 1;
      CPU_DRIVER_OPMODE_ON_AC = "passive";
      CPU_DRIVER_OPMODE_ON_BAT = "active";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_performance";
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MAX_PERF_ON_BAT = 100;
      CPU_MIN_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_SCALING_MAX_FREQ_ON_AC = 3600000;
      CPU_SCALING_MAX_FREQ_ON_BAT = 3600000;
      CPU_SCALING_MIN_FREQ_ON_AC = 3600000;
      CPU_SCALING_MIN_FREQ_ON_BAT = 0;
      DISK_IOSCHED = "mq-deadline";
      INTEL_GPU_BOOST_FREQ_ON_BAT = 300;
      INTEL_GPU_BOOST_FREQ_ON_AC = 1100;
      INTEL_GPU_MAX_FREQ_ON_AC = 1100;
      INTEL_GPU_MAX_FREQ_ON_BAT = 1100;
      INTEL_GPU_MIN_FREQ_ON_AC = 1100;
      INTEL_GPU_MIN_FREQ_ON_BAT = 300;
      NMI_WATCHDOG = 0;
      PLATFORM_PROFILE_ON_AC = "performance";
      PLATFORM_PROFILE_ON_BAT = "balanced";
      SOUND_POWER_SAVE_ON_AC = 0;
      SOUND_POWER_SAVE_ON_BAT = 1;
    };
  };
}