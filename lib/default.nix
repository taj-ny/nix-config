{
  lib ? pkgs.lib,
  pkgs,
  ...
}:

with lib;
with types;
rec {
  flakeRoot = "${toString ./.}/..";

  mkOptionSimple = type: mkOption {
    inherit type;
  };
  mkOptionSimpleDefault = type: default: mkOption {
    inherit type default;
  };

  patchDesktop = pkg: appName: from: to: lib.hiPrio (pkgs.runCommand "$patched-desktop-entry-for-${appName}" {} ''
    ${pkgs.coreutils}/bin/mkdir -p $out/share/applications
    ${pkgs.gnused}/bin/sed 's#${from}#${to}#g' < ${pkg}/share/applications/${appName}.desktop > $out/share/applications/${appName}.desktop
  '');
}