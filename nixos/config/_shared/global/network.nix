{
  lib,
  pkgs,
  ...
}:

{
  environment.etc."doh-client.conf".text = ''
    [[upstream.upstream_ietf]]
        url = "https://9.9.9.9/dns-query"

    [others]
    bootstrap = [
        "194.242.2.2"
    ]
    no_ecs = true
    no_ipv6 = true
    no_user_agent = true
  '';
  networking = {
    firewall.enable = false;
    nameservers = [ "127.0.0.1" "::1" ];
    networkmanager = {
      enable = true;
      dns = "none";
    };
    useDHCP = lib.mkForce false;
  };
  systemd = {
    services.doh-client = {
      after = [ "network.target" ];
      serviceConfig = {
        AmbientCapabilities = "CAP_NET_BIND_SERVICE";
        ExecStart = "${pkgs.dns-over-https}/bin/doh-client -conf /etc/doh-client.conf";
        Restart = "always";
        RestartSec = 3;
        Type = "simple";
        DynamicUser = true;
      };
      wantedBy = [ "multi-user.target" ];
    };
    targets.network-online.wantedBy = lib.mkForce [];
  };
}
