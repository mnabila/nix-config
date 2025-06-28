{ pkgs, ... }:
{
  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluez5-experimental;
  };

  boot.extraModprobeConfig = ''options bluetooth disable_ertm=1 '';
  systemd.user.services.telephony_client.enable = false;
}
