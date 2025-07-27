{
  lib,
  pkgs,
  username,
  ...
}:
{
  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];

  users.users.${username}.extraGroups = lib.mkAfter [ "networkmanager" ];

  # Don't wait for network startup
  systemd.services.NetworkManager-wait-online.serviceConfig.ExecStart = [
    "${pkgs.networkmanager}/bin/nm-online -q"
  ];
}
