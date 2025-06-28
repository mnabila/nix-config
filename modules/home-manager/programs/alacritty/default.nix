{
  programs.alacritty = {
    enable = true;

    settings = {
      env = {
        TERM = "xterm-256color";
      };

      colors = {
        normal = {
          black = "#282828";
          red = "#cc241d";
          green = "#98971a";
          yellow = "#d79921";
          blue = "#458588";
          magenta = "#b16286";
          cyan = "#689d6a";
          white = "#a89984";
        };

        bright = {
          black = "#928374";
          red = "#fb4934";
          green = "#b8bb26";
          yellow = "#fabd2f";
          blue = "#83a598";
          magenta = "#d3869b";
          cyan = "#8ec07c";
          white = "#ebdbb2";
        };

        cursor = {
          cursor = "#ebdbb2";
          text = "#282828";
        };

        primary = {
          background = "#282828";
          foreground = "#ebdbb2";
        };
      };

      cursor.style.shape = "Block";

      font = {
        size = 14.0;
        normal = {
          family = "monospace";
          style = "Regular";
        };
        bold = {
          family = "monospace";
          style = "Bold";
        };
        italic = {
          family = "monospace";
          style = "Italic";
        };
        bold_italic = {
          family = "monospace";
          style = "Bold Italic";
        };
      };

      window = {
        dynamic_padding = true;
        dynamic_title = true;
        padding = {
          x = 2;
          y = 2;
        };
      };
    };
  };
}
