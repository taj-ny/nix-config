{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.modules.kernel;
in
{
  options.modules.kernel = with types; mkOption {
    type = nullOr (enum [ "latest" ]);
  };

  config = mkIf (cfg != null) {
    boot.kernelPackages = pkgs.linuxPackages_latest;
  };
}
