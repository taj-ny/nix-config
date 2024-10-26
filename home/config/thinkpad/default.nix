{
  lib,
  ...
}:

{
  home.stateVersion = "23.05";
  persistence.directories = [
    "Backups"
    "Music"
  ];
  programs = {
    clion.enable = true;
    # intellij-idea-ultimate.enable = true;
    plasma = {
      configFile = {
        kcminputrc = {
          "Libinput/1739/0/Synaptics TM3276-022".PointerAcceleration.value = "0.100";
          "Libinput/2/10/TPPS\\/2 IBM TrackPoint".PointerAcceleration.value = "1.000";
        };
        powerdevilrc = lib.mkForce {
          "AC/Display" = {
            DimDisplayWhenIdle.value = false;
            TurnOffDisplayWhenIdle.value = false;
          };
          "AC/Performance".PowerProfile.value = "performance";
          "AC/SuspendAndShutdown" = {
            AutoSuspendIdleTimeoutSec.value = 1800;
            PowerButtonAction.value = 0;
            PowerDownAction.value = 0;
            SleepMode.value = 3;
          };
          "Battery/Display" = {
            DimDisplayWhenIdle.value = false;
            TurnOffDisplayWhenIdle.value = false;
          };
          "Battery/Performance".PowerProfile.value = "balanced";
          "Battery/SuspendAndShutdown" = {
            AutoSuspendIdleTimeoutSec.value = 900;
            PowerButtonAction.value = 0;
            PowerDownAction.value = 0;
            SleepMode.value = 3;
          };
          "LowBattery/Display" = {
            DimDisplayWhenIdle.value = false;
            TurnOffDisplayWhenIdle.value = false;
            UseProfileSpecificDisplayBrightness.value = false;
          };
          "LowBattery/Performance".PowerProfile.value = "power-saver";
          "LowBattery/SuspendAndShutdown" = {
            AutoSuspendIdleTimeoutSec.value = 900;
            LidAction.value = 2;
            PowerButtonAction.value = 0;
            PowerDownAction.value = 0;
            SleepMode.value = 3;
          };
        };
      };
    };
    rider.enable = true;
  };
}
