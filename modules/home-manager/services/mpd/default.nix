{ config, ... }:
{
  services.mpd = {
    enable = true;
    dataDir = "${config.xdg.dataHome}/mpd";
    musicDirectory = "${config.home.homeDirectory}/Music";
    network = {
      port = 6600;
      listenAddress = "127.0.0.1";
    };
    extraConfig = ''
      auto_update        "yes"
      filesystem_charset "UTF-8"
      audio_output {
          type   "pipewire"
          name   "PipeWire Sound Server"
          device "pipewire"
      }
    '';
  };

}
