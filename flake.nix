{
  description = "NixOS flake v0.3 for personal system with Garuda Nix Subsystem, Home Manager, and numerous other imputs.";

  inputs = {
    flake-parts.url = "https://flakehub.com/f/hercules-ci/flake-parts/0.1.397.tar.gz";
    hardware.url = "https://flakehub.com/f/NixOS/nixos-hardware/0.1.2295.tar.gz";
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1.854036.tar.gz";
    garuda = {
      url = "gitlab:garuda-linux/garuda-nix-subsystem/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    fh.url = "https://flakehub.com/f/DeterminateSystems/fh/\*.tar.gz";

    nix-snapd = {
      url = "https://flakehub.com/f/nix-community/nix-snapd/0.1.62.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    nixified-ai = {
      url = "https://flakehub.com/f/nixified-ai/flake/0.1.76.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    TagStudio.url = "https://github.com/TagStudioDev/TagStudio/archive/refs/tags/v9.5.3.tar.gz";

  };

  outputs = { 
    self, 
    hardware,
    nixpkgs, 
    garuda, 
    nur, 
    fh, 
    nix-snapd, 
    nixified-ai, 
    TagStudio, flake-parts,
    ... }: 
  let
    system = "x86_64-linux";
  in
  { 
    nixosConfigurations.nixos = garuda.lib.garudaSystem {
      inherit system;
        modules = [
          ./configuration.nix
           nix-snapd.nixosModules.default { # snapd for NixOS            
              services.snap.enable = true;
           }
        ];
      };
    };
}

