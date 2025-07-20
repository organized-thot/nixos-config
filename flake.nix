{
  description = "NixOS configuration with Home Manager, Chaotic Nyx, and Garuda Linux NixOS submodule enabled.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    garuda.url = "gitlab:garuda-linux/garuda-nix-subsystem/stable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    chaotic.inputs.nixpkgs.follows = "nixpkgs";
    screenpipe-flake.url = "path:./screenpipe-flake";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, garuda, chaotic, ... }: {
    overlays = {
      default = import ./overlays/default.nix;
      ffmpeg-overlay = import ./overlays/ffmpeg-overlay.nix;
    };
    nixosConfigurations.nixos = {
      nixos = garuda.lib.garudaSystem {
        system = "x86_64-linux";
        modules = [
          ./hardware-configuration.nix
          ./configuration.nix
        ];
        specialArgs = {
          inherit home-manager chaotic garuda inputs;
          overlays = self.overlays.default;
        };
      };
    };
  };
}
