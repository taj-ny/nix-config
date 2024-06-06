{
  hardware = import ./hardware;
  kernel = import ./kernel.nix;
  network = import ./network;
  programs = import ./programs;
  security = import ./security;
  services = import ./services;
  usbkill = import ./usbkill.nix;
}
