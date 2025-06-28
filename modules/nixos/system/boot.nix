{
  pkgs,
  ...
}:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_6_14;

    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };
      efi.canTouchEfiVariables = true;
    };

    kernelParams = [
      "quiet"
      "acpi_backlight=video"
      "rd.udev.log_level=3"
      "v4l2loopback"
    ];

    kernel.sysctl = {
      "kernel.sysrq" = 1;
      "vm.swappiness" = 10;
      "vm.vfs_cache_pressure" = 50;
      "vm.dirty_ratio" = 10;
      "vm.dirty_background_ratio" = 5;
      "kernel.nmi_watchdog" = 0;
    };
  };
}
