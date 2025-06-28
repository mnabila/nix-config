{
  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
    aggressiveResize = true;
    mouse = true;
    focusEvents = true;
    baseIndex = 1;
    escapeTime = 0;
    keyMode = "emacs";
    extraConfig = ''
      ##### GENERAL #####
      set -g set-clipboard on
      set -ga terminal-overrides ",*:Tc"
      set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'

      ##### STATUS LINE #####
      set -g status on
      set -g status-position bottom
      set -g status-interval 60
      set -g status-style "fg=#ebdbb2,bg=#282828"

      # Status Left
      set -g status-left-length 40
      set -g status-left "#[fg=#282828,bg=#a89984,bold] 󰄛  #[fg=#282828,bg=#ebdbb2,bold] #{user} "

      # Status Center
      set -g window-status-format        "#[fg=#282828,bg=#a89984] #I #{pane_current_command} "
      set -g window-status-current-format "#[fg=#282828,bg=#ebdbb2,bold] #I #{pane_current_command} "
      set -g window-status-separator " "
      set -g status-justify centre

      # Status Right
      set -g status-right-length 40
      set -g status-right "#{prefix_highlight} #[fg=#282828,bg=#a89984,bold] 󰩃  #[fg=#282828,bg=#ebdbb2,bold] #{client_name} "

      ##### PANE STYLE #####
      set -g pane-border-status off
      set -g pane-border-style "fg=#a89984,bg=#282828"
      set -g pane-active-border-style "fg=#a89984,bg=#282828"
      set -g pane-border-format "#[fg=#ebdbb2,bg=#a89984] #{pane_current_command} "
      set -g pane-base-index 1
      set -g main-pane-width 1
      set -g main-pane-height 1
      set -g other-pane-width 1
      set -g other-pane-height 1

      ##### WINDOW BEHAVIOR #####
      set -g base-index 1
      set -g renumber-windows on
      setw -g automatic-rename on
      setw -g window-style "fg=#ebdbb2,bg=#282828"
      setw -g window-active-style "fg=#ebdbb2,bg=#282828"

      ##### MESSAGES #####
      set -g message-style "fg=#282828,bg=#ebdbb2"

      ##### KEY BINDINGS #####

      # Navigate windows
      bind -n M-k previous-window
      bind -n M-j next-window

      # Reorder windows
      bind -n M-h { swap-window -t -1; previous-window }
      bind -n M-l { swap-window -t +1; next-window }

      # Split with same directory
      bind % split-window -h -c "#{pane_current_path}"
      bind '"' split-window -v -c "#{pane_current_path}"

      # Move between panes
      bind -n M-H select-pane -L
      bind -n M-L select-pane -R
      bind -n M-K select-pane -U
      bind -n M-J select-pane -D

      # Swap panes
      bind -n M-Up swap-pane -U
      bind -n M-Down swap-pane -D

      # Popup apps
      bind -n M-m display-popup -h 25 -w 100 -E "ncmpcpp"
      bind -n M-n display-popup -h 30 -w 150 -E "newsboat"
      bind -n M-f display-popup -h 30 -w 140 -E "lf"
      bind -n M-M display-popup -h 30 -w 150 -E "neomutt"
      bind -n M-d display-popup -h 30 -w 150 -E "lazydocker"
      bind -n M-t display-popup -h 30 -w 150 -E "htop"
      bind -n M-p display-popup -h 30 -w 150 -E "pulsemixer"
      bind -n M-a display-popup -h 30 -w 150 -E "alsamixer -c 2"

      # Toggle status bar
      bind -n M-b set -g status
    '';
  };
}
