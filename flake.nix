{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    garuda = {
      url = "gitlab:garuda-linux/garuda-nix-subsystem/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-snapd = {
      url = "github:nix-community/nix-snapd";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs @ {
    self,
    nixpkgs,
    garuda,
    home-manager,
    nix-snapd,
    ...
  }: {
    nixosConfigurations = {
      nixos = garuda.lib.garudaSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;}; # Pass inputs if needed in modules
        modules = [
          ./configuration.nix # Local NixOS configuration
          #          home-manager.nixosModules.home-manager # Home Manager module
          #            {
          #              home-manager.useGlobalPkgs = true;
          #              home-manager.useUserPackages = true;
          #              home-manager.users.nix-user = ./home.nix;
          # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
          #            }
          nix-snapd.nixosModules.default
          {
            # Enable snapd module
            services.snap.enable = true;
          }
        ];
      };
    };
  };
}
