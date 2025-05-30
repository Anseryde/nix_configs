# flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpaks.url = "github:gmodena/nix-flatpak";
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    nix-flatpaks,
    plasma-manager,
    nur,
    ...
  }: let
    system = "x86_64-linux";
  in {
    # hostname = test-system-module
    nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    nixosConfigurations = {
      oldfart12 = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          nix-flatpaks.nixosModules.nix-flatpak
          home-manager.nixosModules.home-manager
          nur.modules.nixos.default
          {
            home-manager.backupFileExtension = "backup";
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              flake-inputs = inputs;
              rootPath = ./.;
            };
            home-manager.users.ryann.imports = [
              ./hosts/oldfart12/home.nix
              nix-flatpaks.homeManagerModules.nix-flatpak
            ];
            home-manager.sharedModules = [
              plasma-manager.homeManagerModules.plasma-manager
            ];
          }
          ./hosts/oldfart12/configuration.nix
        ];
      };
      vyasapura = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          nix-flatpaks.nixosModules.nix-flatpak
          home-manager.nixosModules.home-manager
          nur.modules.nixos.default
          {
            home-manager.backupFileExtension = "backup";
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              flake-inputs = inputs;
            };
            home-manager.users.ryann.imports = [
              ./hosts/vyasapura/home.nix
              nix-flatpaks.homeManagerModules.nix-flatpak
            ];
            home-manager.sharedModules = [
              plasma-manager.homeManagerModules.plasma-manager
            ];
          }
          ./hosts/vyasapura/configuration.nix
        ];
      };
    };
  };
}
