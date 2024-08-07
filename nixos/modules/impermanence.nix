{
  config,
  inputs,
  lib,
  ...
}:

with lib;
let
  cfg = config.custom.impermanence;
in
{
  imports = [
    inputs.impermanence.nixosModules.impermanence
  ];

  options.custom.impermanence = with types; {
    enable = mkEnableOption "impermanence";
    persistentDirectories = mkOptionSimpleDefault (listOf anything) [ ];
    persistentFiles = mkOptionSimpleDefault (listOf anything) [ ];
    rootFsSize = mkOptionSimple str;
  };

  config = mkIf cfg.enable {
    environment.persistence."/nix/persist" = {
      hideMounts = true;
      directories = cfg.persistentDirectories;
      files = cfg.persistentFiles;
    };

    fileSystems."/" = {
      device = "tmpfs";
      fsType = "tmpfs";
      options = [ "size=${cfg.rootFsSize}" "mode=755" ];
    };
  };
}
