{ pkgs, ... }:
{
  networking.networkmanager = {
    enable = true;
    wifi.powersave = true;
    dns = "default";
  };

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];

  # Don't wait for network startup
  systemd.services.NetworkManager-wait-online.serviceConfig.ExecStart = [
    "${pkgs.networkmanager}/bin/nm-online -q"
  ];
}
