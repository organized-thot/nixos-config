{
  description = "NixOS configuration with Home Manager, Chaotic Nyx, and Garuda Linux NixOS submodule enabled.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; # Use nixpkgs-unstable for latest
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    garuda.url = "gitlab:garuda-linux/garuda-nix-subsystem/stable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, garuda, chaotic, ... }:
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
	    ./hardware-configuration.nix
	    ./configuration.nix
	    ./home-manager.nix
	    home-manager.nixosModules.home-manager
	    chaotic.nixosModules.default
	  ];
	  specialArgs = { inherit home-manager chaotic garuda; };
        };
      };
    };
}
