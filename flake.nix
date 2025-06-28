{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
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
    }:
    {
      nixosConfigurations = {
        plutonia = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit home-manager; };
          modules = [
            hosts/plutonia
          ];
        };
      };
    };
}
