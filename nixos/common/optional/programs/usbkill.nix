{ outputs, ... }:

{
  imports = [
    outputs.nixosModules.usbkill
  ];

  programs.usbkill.enable = true;
}
