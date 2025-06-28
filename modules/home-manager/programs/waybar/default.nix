{
  programs.waybar = {
    enable = true;
    systemd.enable = false;
    style = builtins.readFile ./style.css;
    settings = {
      top = {
        "name" = "top";
        "layer" = "top";
        "position" = "top";
        "mode" = "dock";
        "margin-top" = 5;
        "margin-left" = 5;
        "margin-right" = 5;
        "height" = 32;
        "spacing" = 10;
        "modules-left" = [
          "river/tags"
          "clock"
        ];
        "modules-center" = [ "river/window" ];
        "modules-right" = [
          "network"
          "temperature"
          "backlight"
          "wireplumber"
          "battery"
          "memory"
          "cpu"
          "tray"
        ];

        "tray" = {
          "icon-size" = 12;
          "spacing" = 5;
        };

        "clock" = {
          "format" = "{:%A; %d %B %Y  %H:%M %Z}";
        };

        "cpu" = {
          "format" = "{usage}% 󰍛";
        };

        "memory" = {
          "format" = "{}% 󰔚";
        };

        "battery" = {
          "states" = {
            "good" = 95;
            "warning" = 30;
            "critical" = 20;
          };
          "format" = "{capacity}% {icon}";
          "format-charging" = "{capacity}% ";
          "format-plugged" = "{capacity}% ";
          "format-alt" = "{time} {icon}";
          "format-icons" = [
            ""
            ""
            ""
            ""
            ""
          ];
        };

        "wireplumber" = {
          "format" = "{volume}% {icon}";
          "format-icons" = [
            ""
            ""
          ];
          "format-muted" = "Muted 󰖁";
          "max-volume" = 100;
          "scroll-step" = 0.1;
          "on-click" = "pamixer --toggle-mute";
        };

        "backlight" = {
          "device" = "acpi_video1";
          "format" = "{percent}% ";
        };

        "river/tags" = {
          "num-tags" = 5;
          "disable-click" = true;
        };

        "river/window" = {
          "format" = "{}";
          "max-length" = 75;
        };

        "temperature" = {
          "critical-threshold" = 65;
          "thermal-zone" = 6;
          "format-critical" = "{temperatureC}°C ";
          "format" = "{temperatureC}°C ";
        };

        "network" = {
          "interface" = "wlp0s20f3";
          "format" = "{ifname}";
          "format-wifi" = "{essid} ({signalStrength}%) ";
          "format-ethernet" = "{ipaddr}/{cidr} 󰊗";
          "tooltip-format" = "{ifname} via {gwaddr} 󰊗";
          "tooltip-format-wifi" = "{essid} ({signalStrength}%) ";
          "tooltip-format-ethernet" = "{ifname} ";
          "tooltip-format-disconnected" = "Disconnected";
          "max-length" = 30;
        };
      };
    };
  };
}
