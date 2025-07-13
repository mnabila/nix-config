{ config, ... }:
{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    historyFile = "${config.xdg.configHome}/.bash_history";
    bashrcExtra = ''
      file-server() {
        caddy file-server --listen :8000 --browse
      }

      sshfm() {
        sshfs -o cache_timeout=600 -o attr_timeout=600 -o entry_timeout=600 -o direct_io -o cache=yes -o kernel_cache $@
      }

      nix-unfree() {
        NIXPKGS_ALLOW_UNFREE=1 nix --impure $@
      }
    '';
  };
}
