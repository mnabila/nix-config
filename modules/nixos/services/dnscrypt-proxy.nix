{
  services.dnscrypt-proxy2 = {
    enable = true;
    settings = {
      # Use local loopback address only
      listen_addresses = [ "127.0.0.1:53" ];

      # List of servers to use
      server_names = [ "cloudflare" ];

      # Enforce DNSSEC
      require_dnssec = true;

      # Server must not log user queries (declarative)
      require_nolog = true;

      # Server must not enforce its own blocklist (for parental control, ads blocking...)
      require_nofilter = true;

      ## Enable a DNS cache to reduce latency and outgoing traffic
      cache = true;
      cache_size = 4096;
      cache_min_ttl = 2400;
      cache_max_ttl = 86400;
      cache_neg_min_ttl = 60;
      cache_neg_max_ttl = 600;

      # Keep connections alive
      keepalive = 30;

      # Log minimal information (for debugging only)
      log_level = 2;

      # Optional fallback resolver (in case of bootstrap failure)
      fallback_resolvers = [
        "1.1.1.1:53"
        "9.9.9.9:53"
      ];
    };
  };
}
