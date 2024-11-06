{
  lib,
  pkgs,
  ...
}:

rec {
  krohnkite = pkgs.callPackage ./krohnkite.nix { };
  kwin-effects-geometry-change = pkgs.callPackage ./kwin-effects-geometry-change { };
  lightly-qt6 = pkgs.kdePackages.callPackage ./lightly-qt6.nix { };
  panel-system-info = pkgs.callPackage ./panel-system-info { };
  plasma-window-title-applet = pkgs.callPackage ./plasma-window-title-applet.nix { };
  vscode-taskexplorer = pkgs.callPackage ./vscode-taskexplorer.nix { };
  wallpaper = pkgs.callPackage ./wallpaper.nix { };

  patchDesktop = pkg: appName: from: to: lib.hiPrio (pkgs.runCommand "$patched-desktop-entry-for-${appName}" {} ''
    ${pkgs.coreutils}/bin/mkdir -p $out/share/applications
    ${pkgs.gnused}/bin/sed 's#${from}#${to}#g' < ${pkg}/share/applications/${appName}.desktop > $out/share/applications/${appName}.desktop
  '');
}
