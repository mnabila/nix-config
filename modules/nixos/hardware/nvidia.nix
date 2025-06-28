{
  config,
  pkgs,
  lib,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    nvidia-container-toolkit
  ];

  boot.kernelParams = lib.mkAfter [
    "nvidia"
    "nvidia_modeset"
    "nvidia_uvm"
    "nvidia_drm"
  ];

  hardware = {
    nvidia-container-toolkit.enable = true;
    nvidia = {
      modesetting.enable = true;
      powerManagement = {
        enable = true;
        finegrained = false;
      };
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.production;

      # Prime
      prime = {
        # Sync
        sync.enable = false;

        # Offload
        offload.enable = true;
        offload.enableOffloadCmd = true;

        # Tip: sudo lshw -c display
        intelBusId = "PCI:00:02:0";
        nvidiaBusId = "PCI:01:00:0";
      };
    };
  };
}
