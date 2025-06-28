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

  networking.wireless = {
    enable = true;
    dbusControlled = true;
    userControlled.enable = true;
    allowAuxiliaryImperativeNetworks = true;
  };

  environment.systemPackages = with pkgs; [
    connman-gtk
  ];
}
