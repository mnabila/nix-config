{ pkgs, ... }:
{
  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [
          "Iosevka Nerd Font"
          "Noto Color Emoji"
        ];
      };
    };
  };

  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk-sans
  ];

  home.file.".local/share/fonts/nerdfonts".source = ./nerdfonts;
  home.file.".local/share/fonts/nerdfonts".recursive = true;
}
