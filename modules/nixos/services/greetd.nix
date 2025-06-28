{ pkgs, ... }:
{
  services.seatd.enable = true;
  services.greetd = {
    enable = true;
    settings = {
      terminal.vt = 1;
      default_session = {
        command = "${pkgs.greetd.greetd}/bin/agreety --cmd ${pkgs.river}/bin/river";
      };
    };
  };

  # unlock GPG keyring on login
  security.pam.services.greetd.enableGnomeKeyring = true;
}
