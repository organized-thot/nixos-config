{
  description = "NixOS configuration with Home Manager, Chaotic Nyx, and Garuda Linux NixOS submodule enabled.";
  inputs = {
    nixpkgs.url = "flake:nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    garuda.url = "gitlab:garuda-linux/garuda-nix-subsystem/stable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
  };
  outputs = inputs:
    let
      flakeContext = {
        inherit inputs;
      };
    in
    {
      nixosConfigurations = {
        nixos = import ./nixosConfigurations/nixos.nix flakeContext;
      };
    };
}
