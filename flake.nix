{
  description = "NixOS with Garuda, Home Manager, and Chaotic AUR";

  inputs = {
    # Use NixOS unstable
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home Manager for user environment
    home-manager.url = "github:nix-community/home-manager";

    # Garuda Linux NixOS module
    garuda.url = "github:garuda-linux/garuda-nix-subsystem/stable";

    # Chaotic Nyx module
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
  };

  outputs = { self, nixpkgs, home-manager, garuda, chaotic, ... }:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hardware-configuration.nix
          ./configuration.nix
          chaotic.nixosModules.chaotic-nyx
        ];
      };

      # Optionally define a Garuda configuration
      garuda = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          garuda.nixosModules.default
          ./configuration.nix
        ];
      };
    };

    # Define Home Manager configuration
    homeConfigurations = {
      nix = home-manager.lib.homeManagerConfiguration {
        inherit system;
        username = "nix";
        homeDirectory = "/home/nix";
        configuration = import ./home.nix;
        pkgs = import nixpkgs { inherit system; };
      };
    };
  };
}
