{
  lib,
  pkgs,
  ...
}:

rec {
  kwin-effects-geometry-change = pkgs.callPackage ./kwin-effects-geometry-change { };
  lightly-qt6 = pkgs.kdePackages.callPackage ./lightly-qt6.nix { };
  nix-ascii-art = pkgs.callPackage ./nix-ascii-art.nix { inherit rascii; };
  nixos-update-notifier = pkgs.callPackage ./nixos-update-notifier { };
  plasma-breath-bamboo-wallpaper = pkgs.callPackage ./plasma-breath-bamboo-wallpaper.nix { };
  plasma-window-title-applet = pkgs.callPackage ./plasma-window-title-applet.nix { };
  polonium = pkgs.callPackage ./polonium.nix { };
  rascii = pkgs.callPackage ./rascii.nix { };
  vscode-taskexplorer = pkgs.callPackage ./vscode-taskexplorer.nix { };

  patchDesktop = pkg: appName: from: to: lib.hiPrio (pkgs.runCommand "$patched-desktop-entry-for-${appName}" {} ''
    ${pkgs.coreutils}/bin/mkdir -p $out/share/applications
    ${pkgs.gnused}/bin/sed 's#${from}#${to}#g' < ${pkg}/share/applications/${appName}.desktop > $out/share/applications/${appName}.desktop
  '');
}
