{ pkgs, ... }:
{
  services.connman = {
    enable = true;
    enableVPN = true;
    wifi.backend = "wpa_supplicant";
    extraFlags = [
      "--nodnsproxy"
    ];
  };

  environment.systemPackages = with pkgs; [
    connman-gtk
  ];
}
