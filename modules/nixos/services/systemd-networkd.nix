{ lib, username, ... }:
{
  # disable dhcpd
  networking.useDHCP = false;

  systemd.network = {
    enable = true;
    networks."10-enp43s0" = {
      matchConfig.Name = "enp43s0";
      networkConfig.DHCP = "yes";
      dhcpConfig.UseDNS = false;
    };
    networks."10-wlp0s20f3" = {
      matchConfig.Name = "wlp0s20f3";
      networkConfig.DHCP = "yes";
      dhcpConfig.UseDNS = false;
    };
  };

  # allow user to access network devices
  users.users.${username}.extraGroups = [ "network" ];

  # disable netowrkd wait online
  systemd.services.systemd-networkd-wait-online.enable = lib.mkForce false;
}
