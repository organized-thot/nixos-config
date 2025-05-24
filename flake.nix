{
  description = "Garuda Linux NixOS module flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    garuda.url = "gitlab:garuda-linux/garuda-nix-subsystem/stable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { garuda, nixpkgs, chaotic, ... }: {
    nixosConfigurations = {
      nixos = garuda.lib.garudaSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          ./garuda-configuration.nix # Your system configuration.
          chaotic.nixosModules.default 
        ];
      };
    };
    homeConfigurations = {
      configName = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [
          ./home-manager-modules/default.nix
          chaotic.homeManagerModules.default
        ];
      };
    };
  };
}
