{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bash
    bash-completion
    cachix
    curl
    git
    gnupg
    htop
    linux-firmware
    lm_sensors
    mesa-demos
    ntfs3g
    pciutils
    wget
  ];
}
