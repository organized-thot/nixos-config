{
  description = "NixOS flake v0.3 for personal system with Garuda Nix Subsystem, and numerous other imputs.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/8913c168d1c56dc49a7718685968f38752171c3b";

    garuda = {
      url = "gitlab:garuda-linux/garuda-nix-subsystem/a20c1e2022dd197da22cb9b470840f5ffab105a2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fh.url = "github:DeterminateSystems/fh/3abaad486737b012e3ecef83e15b4c98b8293424";

    hardware.url = "github:NixOS/nixos-hardware/3441b5242af7577230a78ffb03542add264179ab";

    nur = {
      url = "github:nix-community/NUR/3db8cd4bcccced0748d3896068ac2ead64b640a4";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-snapd = {
      url = "github:nix-community/nix-snapd/355a1ed0141b6fd3093e3cb7b3492e6e67913681";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixified-ai = {
      url = "github:nixified-ai/flake/7172cd645d145400feaad9983e05faff72e3113f";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    TagStudio = { 
      url = "github:TagStudioDev/TagStudio/137c750595fb63a3c3297849f55e9bc32b4fe613";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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
    TagStudio,
    ... }: 
  let
    system = "x86_64-linux";
  in
  { 
    nixosConfigurations.nixos = garuda.lib.garudaSystem {
      inherit system;
        modules = [
          ./nixos/configuration.nix
           nix-snapd.nixosModules.default { # snapd for NixOS            
              services.snap.enable = true;
           }
        ];
      };
    };
}

