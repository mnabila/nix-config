let
  theme = {
    black = "#282828";
    white = "#ebdbb2";
  };
in
{
  programs.zathura = {
    enable = true;
    options = {
      font = "monospace 13";

      # Sandbox
      sandbox = "none";

      # Clipboard
      selection-clipboard = "clipboard";

      # Statusbar
      statusbar-basename = true;
      statusbar-home-tilde = false;

      # Window
      window-title-basename = true;
      window-title-home-tilde = true;
      window-title-page = true;

      # Recoloring
      recolor = false;
      recolor-keephue = false;

      # Highlight
      highlight-transparency = "0.1";

      # Default background
      default-bg = theme.black;
      default-fg = theme.white;

      # Completion
      completion-bg = theme.black;
      completion-fg = theme.white;
      completion-group-bg = theme.black;
      completion-group-fg = theme.white;
      completion-highlight-bg = theme.white;
      completion-highlight-fg = theme.black;

      # Inputbar
      inputbar-bg = theme.black;
      inputbar-fg = theme.white;

      # Statusbar
      statusbar-bg = theme.black;
      statusbar-fg = theme.white;

      # Recolor
      recolor-darkcolor = theme.white;
      recolor-lightcolor = theme.black;

      # Loading
      render-loading-bg = theme.black;
      render-loading-fg = theme.white;
    };
  };
}
