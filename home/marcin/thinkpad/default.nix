{
  imports = [
    ./../common/global

    ./../common/optional/desktop/kde

    ./../common/optional/programs/easyeffects

    ./../common/optional/programs/programming/sdks/dotnet.nix
    ./../common/optional/programs/programming/sdks/php.nix
    ./../common/optional/programs/programming/sdks/python.nix

    ./../common/optional/programs/terminal/konsole
    ./../common/optional/programs/terminal/zsh
  ];

  programs.plasma.configFile = {
    kcminputrc = {
      "Libinput/1739/0/Synaptics TM3276-022".PointerAcceleration.value = "0.100";
      "Libinput/2/10/TPPS\\/2 IBM TrackPoint".PointerAcceleration.value = "1.000";
    };

    powerdevilrc = {
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

  home.stateVersion = "23.05";

  custom.impermanence.persistentDirectories = [ "Music" ];
}
