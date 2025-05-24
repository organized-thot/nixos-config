{
  description = "My NixOS system with Home Manager and Garuda module";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    # Home Manager Module
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    # Garuda module
    garuda.url = "gitlab:garuda-linux/garuda-nix-subsystem/stable";
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