{ pkgs, ... }:
{
  programs.ncmpcpp = {
    enable = true;
    settings = {
      allow_for_physical_item_deletion = true;
      autocenter_mode = true;
      centered_cursor = true;
      colors_enabled = true;
      enable_window_title = true;
      external_editor = "${pkgs.neovim}/bin/nvim";
      header_visibility = false;
      ignore_leading_the = true;
      message_delay_time = 1;
      song_window_title_format = "{%a - }{%t}|{%f}";
      titles_visibility = false;

      mpd_connection_timeout = 5;
      mpd_crossfade_time = 2;
      mpd_host = "localhost";
      mpd_port = 6600;

      playlist_display_mode = "columns";
      song_columns_list_format = "(50)[white]{ar} (50)[white]{t}";

      display_bitrate = true;
      display_remaining_time = false;
      progressbar_look = "━━━";
      progressbar_color = "white";
      progressbar_elapsed_color = "green";
      song_status_format = "{$b$3%t$/b $8by $b$4%a$8$/b}|{%f}";
      statusbar_visibility = true;
    };
  };
}
