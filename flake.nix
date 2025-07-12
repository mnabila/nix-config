{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      chaotic,
      neovim-nightly-overlay,
    }:
    {
      nixosConfigurations = {
        plutonia = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit home-manager;
          };
          modules = [
            ./cachix.nix
            hosts/plutonia
            chaotic.nixosModules.default
            {
              nixpkgs.overlays = [
                neovim-nightly-overlay.overlays.default
              ];
            }
          ];
        };
      };
    };
}
