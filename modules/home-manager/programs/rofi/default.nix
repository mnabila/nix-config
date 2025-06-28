{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    font = "Iosevka Nerd Font 12";
    location = "center";
    terminal = "${pkgs.alacritty}/bin/alacritty";
    theme = "gruvbox";
  };

  home.file.".config/rofi/themes/gruvbox.rasi".source = ./themes/gruvbox.rasi;
}
