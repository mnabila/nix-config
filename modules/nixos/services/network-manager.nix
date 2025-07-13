{
  pkgs,
  lib,
  username,
  ...
}:
{
  networking.networkmanager = {
    enable = true;
    wifi.powersave = true;
    dns = "default";
  };

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];

  users.users.${username}.extraGroups = lib.mkAfter [ "networkmanager" ];

  # Don't wait for network startup
  systemd.services.NetworkManager-wait-online.serviceConfig.ExecStart = [
    "${pkgs.networkmanager}/bin/nm-online -q"
  ];
}
