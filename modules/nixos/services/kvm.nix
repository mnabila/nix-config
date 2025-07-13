{ lib, username, ... }:

{
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  users.users.${username}.extraGroups = lib.mkAfter [ "libvirtd" ];
}
