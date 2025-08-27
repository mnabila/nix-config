{
  lib,
  ...
}:
{
  networking.wireless.iwd = {
    enable = true;
    settings = {
      DriverQuirks = {
        UseDefaultInterface = true;
      };

      Settings = {
        AutoConnect = true;
      };

      Scan = {
        DisablePeriodicScan = true;
      };
    };
  };

  systemd.network.links."80-iwd" = lib.mkForce {
    matchConfig.Type = "wlan";
    linkConfig.NamePolicy = "path";
  };
}
