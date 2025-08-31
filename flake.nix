{
  inputs = {
<<<<<<< HEAD
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    garuda = {
      url = "gitlab:garuda-linux/garuda-nix-subsystem/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fh.url = "https://flakehub.com/f/DeterminateSystems/fh/*.tar.gz";

    nix-snapd = {
      url = "https://flakehub.com/f/nix-community/nix-snapd/0.1.62.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixified-ai.url = "https://flakehub.com/f/nixified-ai/flake/0.1.76.tar.gz";

    TagStudio.url = "https://github.com/TagStudioDev/TagStudio/archive/refs/tags/v9.5.3.tar.gz";

  };

  outputs = { 
    self, 
    nixpkgs, 
    home-manager, 
    garuda, 
    nur, 
    fh, 
    nix-snapd, 
    nixified-ai, 
    TagStudio,
    ... }: 
  { 
    nixosConfigurations = {
      nixos-fh = garuda.lib.garudaSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
           home-manager.nixosModules.home-manager
           nix-snapd.nixosModules.default { # snapd for NixOS            
              services.snap.enable = true;
           }
        ];
      };
=======
    # This is pointing to an unstable release.
    # If you prefer a stable release instead, you can this to the latest number shown here: https://nixos.org/download
    # i.e. nixos-24.11
    # Use `nix flake update` to update the flake to the latest revision of the chosen release channel.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = inputs@{ self, nixpkgs, ... }: {
    # NOTE: 'nixos' is the default hostname
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [ ./configuration.nix ];
>>>>>>> fh-regenerate
    };
  };
}

