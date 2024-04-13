{ pkgs }:

rec {
  klassy = pkgs.kdePackages.callPackage ./klassy.nix { };
  lightlyshaders = pkgs.kdePackages.callPackage ./lightlyshaders.nix { };
  nix-ascii-art = pkgs.callPackage ./nix-ascii-art.nix { inherit rascii; };
  paneltransparencybutton = pkgs.callPackage ./paneltransparencybutton.nix { };
  plasma-panel-colorizer = pkgs.callPackage ./plasma-panel-colorizer.nix { };
  plasma-panel-spacer-extended = pkgs.callPackage ./plasma-panel-spacer-extended.nix { };
  plasma-window-title-applet = pkgs.callPackage ./plasma-window-title-applet.nix { };
  polonium = pkgs.callPackage ./polonium.nix { };
  rascii = pkgs.callPackage ./rascii.nix { };
  usbkill = pkgs.python3Packages.callPackage ./usbkill.nix { };
  vscode-nvim = pkgs.callPackage ./vscode-nvim.nix { buildVimPlugin = pkgs.vimUtils.buildVimPlugin; };

  patchDesktop = import ./patch-desktop.nix { inherit pkgs; };
}
