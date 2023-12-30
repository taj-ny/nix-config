{ pkgs }:

rec {
  klassy = pkgs.libsForQt5.callPackage ./klassy.nix { };
  nix-ascii-art = pkgs.callPackage ./nix-ascii-art.nix { inherit rascii; };
  paneltransparencybutton = pkgs.callPackage ./paneltransparencybutton.nix { };
  rascii = pkgs.callPackage ./rascii.nix { };
  usbkill = pkgs.python3Packages.callPackage ./usbkill.nix { };
  vscode-nvim = pkgs.callPackage ./vscode-nvim.nix { buildVimPlugin = pkgs.vimUtils.buildVimPlugin; };

  patchDesktop = import ./patch-desktop.nix { inherit pkgs; };
}
