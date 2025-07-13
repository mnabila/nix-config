{ lib, username, ... }:
{
  virtualisation.docker.enable = true;
  users.users.${username}.extraGroups = lib.mkAfter [ "docker" ];
}
