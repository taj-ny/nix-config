{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.modules.network.encryptedDns;
in
{
  options.modules.network.encryptedDns.enable = mkEnableOption "Encrypted DNS";

  config = mkIf cfg.enable {
    networking = {
      nameservers = [ "127.0.0.1" "::1" ];

      dhcpcd.extraConfig = "nohook resolv.conf";
      networkmanager.dns = "none";
    };

    services.dnscrypt-proxy2 = {
      enable = true;

      settings = {
        ipv6_servers = true;
        require_dnssec = true;
        server_names = [ "nextdns" "cloudflare" ];

        sources.public-resolvers = {
          cache_file = "/var/lib/dnscrypt-proxy2/public-resolvers.md";
          minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";

          urls = [
            "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
            "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
          ];
        };
      };
    };

    systemd.services.dnscrypt-proxy2.serviceConfig.StateDirectory = "dnscrypt-proxy";
  };
}
