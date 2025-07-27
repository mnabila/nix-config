{ pkgs, ... }:
{
  services.connman = {
    enable = true;
    enableVPN = true;
    wifi.backend = "iwd";
    extraFlags = [
      "--nodnsproxy"
    ];
  };

  environment.systemPackages = with pkgs; [
    connman-gtk
  ];
}
