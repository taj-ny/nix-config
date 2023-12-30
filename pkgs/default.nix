{ pkgs ? (import ../nixpkgs.nix) { } }:

rec {
  klassy = pkgs.libsForQt5.callPackage ./klassy.nix { };
  nix-ascii-art = pkgs.callPackage ./nix-ascii-art.nix { inherit rascii; };
  paneltransparencybutton = pkgs.callPackage ./paneltransparencybutton.nix { };
  rascii = pkgs.callPackage ./rascii.nix { };
  usbkill = pkgs.python3Packages.callPackage ./usbkill.nix { };
}
