{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wlr-randr
    wl-mirror
  ];

  services.kanshi = {
    enable = true;

    settings = [
      # Profile 1: Laptop only
      {
        profile = {
          name = "laptop";
          outputs = [
            {
              criteria = "eDP-1";
              status = "enable";
              mode = "1920x1080@144Hz";
              position = "0,0";
            }
          ];
        };
      }

      # Profile 2: External monitor only
      {
        profile = {
          name = "external";
          outputs = [
            {
              criteria = "HDMI-A-1";
              status = "enable";
              mode = "1920x1080@60Hz";
              position = "0,0";
            }
            {
              criteria = "eDP-1";
              status = "disable";
            }
          ];
        };
      }

      # Profile 3: Dual monitor setup
      {
        profile = {
          name = "dual";
          outputs = [
            {
              criteria = "eDP-1";
              status = "enable";
              mode = "1920x1080@144Hz";
              position = "0,0";
            }
            {
              criteria = "HDMI-A-1";
              status = "enable";
              mode = "1920x1080@60Hz";
              position = "1920,0";
            }
          ];
        };
      }
    ];
  };
}
