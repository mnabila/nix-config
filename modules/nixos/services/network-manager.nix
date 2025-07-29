{
  lib,
  pkgs,
  username,
  ...
}:
{
  networking.networkmanager = {
    enable = true;
    dns = "default";
  };

  # Disable the old 'resolvconf' service to avoid conflict with NetworkManager
  networking.resolvconf.enable = false;

  # Symlink /etc/resolv.conf to NetworkManager's dynamically generated file
  environment.etc."resolv.conf".source = "/run/NetworkManager/resolv.conf";

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];

  users.users.${username}.extraGroups = lib.mkAfter [ "networkmanager" ];

  # Don't wait for network startup
  systemd.services.NetworkManager-wait-online.serviceConfig.ExecStart = [
    "${pkgs.networkmanager}/bin/nm-online -q"
  ];
}
