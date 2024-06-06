{ config, lib, ... }:

with lib;
let
  cfg = config.modules.services.tor;
in
{
  options.modules.services.tor.enable = mkEnableOption "Tor";

  config.services.tor = mkIf cfg.enable {
    enable = true;

    client.enable = true;
  };
}
