{
  description = "NixOS config with FlakeHub, Garuda Nix Subsystem, Home Manager, Nix User Repository, and snapd enabled";

  inputs = {
    fh.url = "https://flakehub.com/f/DeterminateSystems/fh/*.tar.gz";
    
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.2305.*.tar.gz";

    garuda = {
      url = "gitlab:garuda-linux/garuda-nix-subsystem/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "https://flakehub.com/f/nix-community/home-manager/0.2505.4804.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-snapd = {
      url = "https://flakehub.com/f/nix-community/nix-snapd/0.1.62.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    fh,
    nixpkgs,
    garuda,
    home-manager,
    nix-snapd,
    ...
  }: {
    nixosConfigurations = {
      nixos-fh = nixpkgs.lib.nixosSystem
        nixos-fh = garuda.lib.garudaSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;}; # Pass inputs if needed in modules
        modules = [
          {
            environment.systemPackages = [ fh.packages.x86_64-linux.default ];
          }

          ./configuration.nix # Local NixOS configuration

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
