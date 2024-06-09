{
  hardware = import ./hardware;
  network = import ./network;
  nixos = import ./nixos;
  programs = import ./programs;
  security = import ./security;
  services = import ./services;
  usbkill = import ./usbkill.nix;
}
