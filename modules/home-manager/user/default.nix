{
  pkgs,
  username,
  stateVersion,
  ...
}:
{
  imports = [
    ../common/dconf.nix
    ../common/fonts
    ../common/gtk.nix
    ../common/qt.nix

    ../programs/alacritty
    ../programs/bash
    ../programs/fzf
    ../programs/git
    ../programs/gpg
    ../programs/lf
    ../programs/lutris
    ../programs/ncmpcpp
    ../programs/neovim
    ../programs/obs
    ../programs/river
    ../programs/rofi
    ../programs/starship
    ../programs/swaylock
    ../programs/tmux
    ../programs/waybar
    ../programs/zathura

    ../services/batsignal
    ../services/cliphist
    ../services/dunst
    ../services/flameshot
    ../services/gpg-agent
    ../services/kanshi
    ../services/mpd
    ../services/polkit
    ../services/swww
  ];

  home = {
    stateVersion = stateVersion;
    username = username;
    homeDirectory = "/home/${username}";

    pointerCursor = {
      name = "phinger-cursors-dark";
      package = pkgs.phinger-cursors;
      size = 24;
      gtk.enable = true;
    };

    sessionVariables = {
      # session
      XDG_CURRENT_DESKTOP = "river";
      XDG_SESSION_DESKTOP = "river";

      # other
      EDITOR = "nvim";
      VISUAL = "nvim";
      MANPAGER = "nvim +Man!";

      # qt themes
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_SCALE_FACTOR = "1";
      QT_SCREEN_SCALE_FACTORS = "1";
    };

    sessionPath = [
      "/home/${username}/.local/bin"
      "/home/${username}/go/bin"
      "/home/${username}/.local/share/node/bin"
    ];
  };

  home.packages = with pkgs; [
    lazydocker
    libnotify
    nodePackages.nodejs
    mpv
    brightnessctl
    nwg-look
    openssl
    pamixer
    papirus-icon-theme
    libnotify
    pass
    playerctl
    pop-icon-theme
    python3Full
    tessen
    wl-clipboard
    file
  ];
}
