{ pkgs, ... }:
{
  xdg = {
    portal = {
      enable = true;
      wlr = {
        enable = true;
      };
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
      config = {
        common = {
          default = [ "wlr" ];
          "org.freedesktop.impl.portal.ScreenCast" = [ "wlr" ];
          "org.freedesktop.impl.portal.OpenURI" = [ "gtk" ];
        };
      };
    };
    mime = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    xdg-utils
    desktop-file-utils
  ];
}
