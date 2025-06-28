{ pkgs, ... }:
{
  services.gpg-agent = {
    enable = true;
    enableBashIntegration = true;
    enableSshSupport = true;
    defaultCacheTtl = 1800;
    defaultCacheTtlSsh = 1800;
    maxCacheTtl = 1800;
    maxCacheTtlSsh = 1800;
    pinentry.package = pkgs.pinentry-gtk2;
  };
}
