{
  services.dnscrypt-proxy2 = {
    enable = true;

    settings = {
      ## Global
      listen_addresses = [ "127.0.0.1:53" ];
      max_clients = 250;
      server_names = [ "personal" ];

      ## Server selection
      ipv4_servers = true;
      ipv6_servers = false;
      dnscrypt_servers = true;
      doh_servers = true;
      odoh_servers = false;

      require_dnssec = false;
      require_nolog = true;
      require_nofilter = true;

      ## Connection
      force_tcp = false;
      timeout = 5000;
      keepalive = 30;

      ## Cache
      cache = true;
      cache_size = 4096;
      cache_min_ttl = 2400;
      cache_max_ttl = 86400;
      cache_neg_min_ttl = 60;
      cache_neg_max_ttl = 600;

      ## Bootstrap resolvers
      bootstrap_resolvers = [
        "8.8.8.8:53"
        "1.1.1.1:53"
      ];

      ## Fallback resolvers
      fallback_resolvers = [
        "8.8.8.8:53"
        "1.1.1.1:53"
      ];

      ignore_system_dns = true;

      ## Filters
      block_ipv6 = false;
      block_unqualified = true;
      block_undelegated = true;

      ## additional servers
      static = {
        personal = {
          stamp = "sdns://AgcAAAAAAAAADDk0LjE0MC4xNC40OQARZC5hZGd1YXJkLWRucy5jb20TL2Rucy1xdWVyeS84YmZkOTM5ZQ";
        };
      };
    };
  };

  networking.nameservers = [ "127.0.0.1" ];
  services.resolved.enable = false;
}
