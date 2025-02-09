{

  description = "My main flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations = {
      nixos-twitt = lib.nixosSystem {
        inherit system;
        modules = [ ./profiles/longshot/configuration.nix ];
      };
    };
    homeConfigurations = {
      trevor = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./profiles/longshot/home.nix ];
      };
    };
  };

}
