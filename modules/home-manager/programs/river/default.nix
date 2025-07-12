{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wideriver
  ];

  wayland.windowManager.river = {
    enable = true;
    xwayland.enable = true;
    systemd = {
      enable = true;
      variables = [
        "XDG_CURRENT_DESKTOP"
        "XDG_SESSION_DESKTOP"
        "XDG_SESSION_TYPE"
      ];
    };
    extraConfig = ''
      riverctl rule-add ssd
      riverctl spawn "wideriver --layout left \
        --ratio-master 0.5 \
        --stack even \
        --outer-gaps 5 \
        --inner-gaps 5 \
        --border-color-focused 0xebdbb2 \
        --border-color-unfocused 0x665c54 \
        --layout-alt monocle \
        --border-width 2 \
        --border-width-monocle 2 \
        --border-color-focused-monocle 0xebdbb2"

      systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
    '';
    settings = {
      # Keyboard repeat rate
      set-repeat = "50 300";

      # Background color
      "background-color" = "0x282828";

      # Default layout engine
      "default-layout" = "wideriver";

      # Server-side decorations
      "rule-add" = {
        "-app-id" = {
          "Pinentry-gtk" = "float";
          "xdg-desktop-portal-gtk" = "float";
          "nm-connection-editor" = "float";
          "connman-gtk" = "float";
          "wpsoffice" = "csd";
        };
      };

      # Touchpad configuration
      input."pointer-1267-12632-ELAN050A:01_04F3:3158_Touchpad" = {
        tap = true;
        drag = true;
        accel-profile = "none";
        pointer-accel = 0.3;
      };

      map-pointer.normal = {
        "Super BTN_LEFT" = "move-view";
        "Super BTN_RIGHT" = "resize-view";
        "Super BTN_MIDDLE" = "toggle-float";
      };

      map = {
        normal = {
          # audio
          "None XF86AudioRaiseVolume" = "spawn 'pamixer -i 2'";
          "None XF86AudioLowerVolume" = "spawn 'pamixer -d 2'";
          "None XF86AudioMute" = "spawn 'pamixer --toggle-mute'";
          "None XF86AudioMedia" = "spawn 'playerctl play-pause'";
          "None XF86AudioPlay" = "spawn 'playerctl play-pause'";
          "None XF86AudioPrev" = "spawn 'playerctl previous'";
          "None XF86AudioNext" = "spawn 'playerctl next'";

          # brightness
          "None XF86MonBrightnessUp" = "spawn 'brightnessctl set 2%+'";
          "None XF86MonBrightnessDown" = "spawn 'brightnessctl set 2%-'";

          # switch focus tag
          "Super 1" = "set-focused-tags 1";
          "Super 2" = "set-focused-tags 2";
          "Super 3" = "set-focused-tags 4";
          "Super 4" = "set-focused-tags 8";
          "Super 5" = "set-focused-tags 16";

          # move window to other tag
          "Super+Shift 1" = "set-view-tags 1";
          "Super+Shift 2" = "set-view-tags 2";
          "Super+Shift 3" = "set-view-tags 4";
          "Super+Shift 4" = "set-view-tags 8";
          "Super+Shift 5" = "set-view-tags 16";

          # toggle focus window to other tag
          "Super+Control 1" = "toggle-focused-tags 1";
          "Super+Control 2" = "toggle-focused-tags 2";
          "Super+Control 3" = "toggle-focused-tags 4";
          "Super+Control 4" = "toggle-focused-tags 8";
          "Super+Control 5" = "toggle-focused-tags 16";

          # General keybindings
          "Super Return" = "spawn alacritty";
          "Super W" = "close";
          "Super+Alt Q" = "exit";
          "Super M" = "zoom";
          "Super J" = "focus-view next";
          "Super K" = "focus-view previous";
          "Super H" = "focus-view left";
          "Super L" = "focus-view right";
          "Super+Shift J" = "swap next";
          "Super+Shift K" = "swap previous";
          "Super+Shift H" = "swap left";
          "Super+Shift L" = "swap right";
          "Super Period" = "focus-output next";
          "Super Comma" = "focus-output previous";
          "Super+Shift Period" = "send-to-output next";
          "Super+Shift Comma" = "send-to-output previous";
          "Super+Shift F" = "toggle-float";
          "Super F" = "toggle-fullscreen";
          "Super D" = "spawn 'rofi -show drun'";
          "Super+Shift D" = "spawn 'rofi -show run'";
          "Super BackSpace" =
            "spawn 'notify-send \"Pass Man\" \"Clear Cache Time Out : $(gpg-connect-agent reloadagent /bye)\"'";
          "Super+Shift BackSpace" = "spawn 'tessen -d rofi'";
          "Super C" = "spawn 'cliphist list | rofi -dmenu -p Clipboard | cliphist decode | wl-copy'";
          "Super+Shift C" = "spawn 'cliphist wipe'";
          "None Print" = "spawn 'flameshot gui --raw | wl-copy'";
          "Super+Shift Print" = "spawn 'flameshot full --raw | wl-copy'";
          "Super Print" = "spawn 'flameshot gui'";
          "Super P" = "spawn dmenu_power";
          "Super S" = "spawn dmenu_mager";
          "Super Tab" = "spawn 'rofi -show window'";
          "Super+Shift Return" = "spawn 'swaylock'";

          # Wideriver
          "Super Space" = "send-layout-cmd wideriver '--layout-toggle'";
          "Super plus" = "send-layout-cmd wideriver '--ratio +0.01'";
          "Super equal" = "send-layout-cmd wideriver '--ratio 0.5'";
          "Super minus" = "send-layout-cmd wideriver '--ratio -0.01'";
        };
      };
    };
  };

  systemd.user.services = {
    wl-paste-cliphist = {
      Unit = {
        Description = "Clipboard History";
        After = [ "graphical-session.target" ];
      };
      Service = {
        ExecStart = "${pkgs.wl-clipboard}/bin/wl-paste --watch ${pkgs.cliphist}/bin/cliphist store";
        Restart = "on-failure";
      };
      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
    };

    swww-restore = {
      Unit = {
        Description = "Sww Restore";
        After = [ "graphical-session.target" ];
      };
      Service = {
        ExecStart = "${pkgs.swww}/bin/swww restore";
        Restart = "on-failure";
      };
      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
    };
  };
}
