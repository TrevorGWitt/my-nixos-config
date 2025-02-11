{

  description = "My main flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }:
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
        allowInsecure = true;
        permittedInsecurePackages = [
          "dotnet-runtime-7.0.20"
          #"aspnetcore-runtime-6.0.36"
          # "aspnetcore-runtime-wrapped-6.0.36"
          # "dotnet-sdk-6.0.428"
          # "dotnet-sdk-wrapped-6.0.428"
        ];
      };
    };
    pkgs-unstable = import nixpkgs-unstable {
      system = "x86_64-linux";
      config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
        allowInsecure = true;
        permittedInsecurePackages = [
          "dotnet-runtime-7.0.20"
          #"aspnetcore-runtime-6.0.36"
          # "aspnetcore-runtime-wrapped-6.0.36"
          # "dotnet-sdk-6.0.428"
          # "dotnet-sdk-wrapped-6.0.428"
        ];
      };
    };
    in {
    nixosConfigurations = {
      nixos-twitt = lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit pkgs-unstable;
        };
        modules = [ ./profiles/longshot/configuration.nix ];
      };
    };
    homeConfigurations = {
      trevor = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit pkgs-unstable;
        };
        modules = [ ./profiles/longshot/home.nix ];
      };
    };
  };

}
