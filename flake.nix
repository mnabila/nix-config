{
  description = "mnabila's nix configuration";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    chaotic = {
      url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    };
    neovim-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      chaotic,
      neovim-overlay,
    }:
    {
      nixosConfigurations = {
        plutonia = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit home-manager;
            username = "saya";
            hostname = "plutonia";
            stateVersion = "25.05";
          };
          modules = [
            ./cachix.nix
            hosts/plutonia
            chaotic.nixosModules.default
            {
              nixpkgs.overlays = [
                neovim-overlay.overlays.default
              ];
            }
          ];
        };
      };
    };
}
