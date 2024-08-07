{ pkgs }:

rec {
  kwin-effects-geometry-change = pkgs.callPackage ./kwin-effects-geometry-change { };
  lightly-qt6 = pkgs.kdePackages.callPackage ./lightly-qt6.nix { };
  lightlyshaders = pkgs.kdePackages.callPackage ./lightlyshaders.nix { };
  nix-ascii-art = pkgs.callPackage ./nix-ascii-art.nix { inherit rascii; };
  nixos-update-notifier = pkgs.callPackage ./nixos-update-notifier { };
  plasma-breath-wallpapers = pkgs.callPackage ./plasma-breath-wallpapers.nix { };
  plasma-window-title-applet = pkgs.callPackage ./plasma-window-title-applet.nix { };
  polonium = pkgs.callPackage ./polonium.nix { };
  rascii = pkgs.callPackage ./rascii.nix { };
  usbkill = pkgs.python3Packages.callPackage ./usbkill.nix { };
  vscode-taskexplorer = pkgs.callPackage ./vscode-taskexplorer.nix { };
}
