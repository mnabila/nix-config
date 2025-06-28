{ lib, ... }:
{
  # Allow unfree packages (required for things like the NVIDIA driver)
  nixpkgs.config.allowUnfree = lib.mkForce true;

  # Nix package manager configuration
  nix = {
    settings = {
      # Automatically deduplicate identical files in /nix/store
      # To manually run: `nix-store --optimise`
      # Ref: https://nixos.org/manual/nix/stable/command-ref/conf-file.html#conf-auto-optimise-store
      auto-optimise-store = true;

      # Enable required experimental features (for flakes, etc.)
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };

    # Enable automatic garbage collection weekly
    # Helps reclaim disk space by removing old builds
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
  };

  # Disable all system documentation to save disk space
  documentation = {
    enable = false;
    info.enable = false;
  };

  services = {
    # Enable weekly fstrim on SSDs to maintain performance
    fstrim.enable = true;

    # Enable scx scheduler (if you're experimenting with custom CPU schedulers)
    scx.enable = true;
    scx.scheduler = "scx_rusty";
  };
}
