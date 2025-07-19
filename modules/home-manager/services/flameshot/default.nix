{ pkgs, ... }:
{
  home.packages = with pkgs; [
    grim
  ];

  services.flameshot = {
    enable = true;
    package = pkgs.flameshot.override {
      enableWlrSupport = true;
    };
    settings = {
      General = {
        contrastOpacity = 127;
        contrastUiColor = "#282828";
        drawColor = "#ffff00";
        drawFontSize = 10;
        drawThickness = 1;
        filenamePattern = "screenshot_%Y-%m-%e_%I:%M:%S";
        savePath = "/home/saya/Desktop";
        showDesktopNotification = false;
        uiColor = "#ebdbb2";
        undoLimit = 105;
      };
    };
  };
}
