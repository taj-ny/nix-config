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

  # TODO Consider using TLP instead
  programs.plasma.configFile = {
    kcminputrc = {
      "Libinput/1739/0/Synaptics TM3276-022".PointerAcceleration.value = "0.100";
      "Libinput/2/10/TPPS\\/2 IBM TrackPoint".PointerAcceleration.value = "1.000";
    };

    powermanagementprofilesrc = {
      "AC/PowerProfile".profile.value = "performance";
      "Battery/PowerProfile".profile.value = "balanced";
      "LowBattery/PowerProfile".profile.value = "power-saver";
    };
  };

  home.stateVersion = "23.05";

  custom.impermanence.persistentDirectories = [ "Music" ];
}
