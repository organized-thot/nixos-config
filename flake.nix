{
  description = "My NixOS system with Home Manager and Garuda module";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Garuda module (assuming this is what you mean)
    garuda.url = "github:garuda-linux/garuda-nixos-config";
    garuda.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, garuda, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        ./hardware-configuration.nix

        # Home Manager as a module
        home-manager.nixosModules.home-manager
        {
          home-manager.useUserPackages = true;
          home-manager.users.nix = import ./home.nix;
        }

        # Garuda module (if it exports a nixos module)
        garuda.nixosModules.default
      ];
    };
  };
}