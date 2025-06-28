{ pkgs, ... }:
{
  programs.lutris = {
    enable = true;
    extraPackages = with pkgs; [
      mangohud
      vkd3d
      winetricks
    ];
    winePackages = with pkgs; [
      wineWow64Packages.stagingFull
    ];
  };
}
