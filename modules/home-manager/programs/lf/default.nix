{
  xdg.configFile."lf/icons".source = ./icons;

  programs.lf = {
    enable = true;
    commands = import ./commands.nix;
    settings = {
      ignorecase = true;
      scrolloff = 10;
      icons = true;
      ratios = "1:3:2";
      promptfmt = "\\033[32;1m%u\\033[0m ❱ \\033[34;1m%d\\033[0m\\033[1m%f\\033[0m";
    };
    keybindings = {
      # Command mappings
      "f" = "fzf_select";
      "D" = "delete";
      "x" = "&dragon-drop -a -x $fx";
      "R" = "reload";
      "o" = "open";
      "md" = "mkdir";
      "mf" = "touch";
      "br" = "bulkrename";
      "mt" = "mimetype";
      "ex" = "extract";

      # Directory shortcuts
      "gM" = "cd /run/media/";
      "gm" = "cd /mnt/";
      "gt" = "cd /tmp/";

      # Yank operations (copy to clipboard)
      "Yn" = "&echo -n $(basename \"$f\") | wl-copy";
      "Yp" = "&echo -n \"$f\" | wl-copy";
      "Yd" = "&echo -n $(dirname \"$f\") | wl-copy";

      # Ratio shortcuts
      "<a-0>" = "set ratios 1:3:2";
      "<a-1>" = ":set nopreview; set ratios 1";
      "<a-2>" = ":set preview; set ratios 2:2";
      "<a-3>" = ":set preview; set ratios 1:2:3";
    };
  };

}
