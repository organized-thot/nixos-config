{
  inputs = {

    hardware.url = "github:NixOS/nixos-hardware";

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

    fh.url = "https://flakehub.com/f/DeterminateSystems/fh/\*.tar.gz";

    nix-snapd = {
      url = "https://flakehub.com/f/nix-community/nix-snapd/0.1.62.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixified-ai.url = "https://flakehub.com/f/nixified-ai/flake/0.1.76.tar.gz";

    TagStudio.url = "https://github.com/TagStudioDev/TagStudio/archive/refs/tags/v9.5.3.tar.gz";

  };

  outputs = { 
    self, 
    hardware,
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
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      hostname = garuda.lib.garudaSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
           home-manager.nixosModules.home-manager
           nix-snapd.nixosModules.default { # snapd for NixOS            
              services.snap.enable = true;
           }
        ];
      };
  };
}

