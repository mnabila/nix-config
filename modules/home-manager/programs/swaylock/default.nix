{ config, ... }:
{
  programs.swaylock = {
    enable = true;
    settings = {
      bs-hl-color = "fb4934";
      caps-lock-bs-hl-color = "fb4934";
      caps-lock-key-hl-color = "b8bb26";
      color = "282828";
      font = "Iosevka Nerd Font";
      image = "${config.xdg.configHome}/swaylock/image.png";
      inside-caps-lock-color = "00000000";
      inside-clear-color = "00000000";
      inside-color = "00000000";
      inside-ver-color = "00000000";
      inside-wrong-color = "00000000";
      key-hl-color = "b8bb26";
      layout-bg-color = "00000000";
      layout-border-color = "00000000";
      layout-text-color = "ebdbb2";
      line-caps-lock-color = "00000000";
      line-clear-color = "00000000";
      line-color = "00000000";
      line-ver-color = "00000000";
      line-wrong-color = "00000000";
      ring-caps-lock-color = "fe8019";
      ring-clear-color = "fb4934";
      ring-color = "ebdbb2";
      ring-ver-color = "458588";
      ring-wrong-color = "cc241d";
      separator-color = "00000000";
      text-caps-lock-color = "fe8019";
      text-clear-color = "fb4934";
      text-color = "ebdbb2";
      text-ver-color = "458588";
      text-wrong-color = "cc241d";
    };
  };

  xdg.configFile."swaylock/image.png".source = ./image.png;
}
