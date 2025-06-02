{
  lib,
  ...
}:

{
  environment.etc."thinkfan.yaml".text = ''
    sensors:
      - chip: coretemp-isa-0000
        ids: [ "Package id 0", "Core 0", "Core 1", "Core 2", "Core 3" ]

      - chip: thinkpad-isa-0000
        ids: [ CPU ]

    fans:
      - tpacpi: /proc/acpi/ibm/fan

    levels:
      - [ 0, 0, 60 ]
      - [ "level auto", 60, 85 ]
      - [ "level disengaged", 85, 255 ]
  '';
  services.thinkfan.enable = true;
  systemd.services.thinkfan.environment.THINKFAN_ARGS = lib.mkForce "";
}