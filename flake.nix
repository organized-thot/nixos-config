{
  description = "NixOS config with FlakeHub, Garuda Nix Subsystem, Home Manager, Nix User Repository, and snapd enabled";

  inputs = {
    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";
    fh.url = "https://flakehub.com/f/DeterminateSystems/fh/*.tar.gz";
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0";
    
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

    nixified-ai.url = "https://flakehub.com/f/nixified-ai/flake/0.1.76.tar.gz";
  };

  outputs = inputs @ {
    self,
    determinate,
    fh,
    nixpkgs,
    garuda,
    home-manager,
    nix-snapd, nixified-ai,
    ...
  }: {
    nixosConfigurations = {
      nixos-fh = garuda.lib.garudaSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;}; # Pass inputs if needed in modules
        modules = [
          ./configuration.nix # Local NixOS configuration

          determinate.nixosModules.default
          {
            environment.systemPackages = [ fh.packages.x86_64-linux.default ];
          }

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
