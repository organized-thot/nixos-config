{
  description = "NixOS configuration with Home Manager, Chaotic Nyx, and Garuda Linux NixOS submodule enabled.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    garuda.url = "github:garuda-linux/garuda-nix-subsystem/stable";
    chaotic-nyx.url = "github:chaotic-nyx/nyxpkgs/main";
    screenpipe-flake.url = "path:./screenpipe-flake";
  };

  outputs = { nixpkgs, garuda, chaotic-nyx, ... }: {  # Add chaotic-nyx to parameters
    overlays = {
      default = import ./overlays/default.nix;
      # ffmpeg-overlay = import ./overlays/ffmpeg-overlay.nix;
    };
    nixosConfigurations.nixos = garuda.lib.garudaSystem {
        system = "x86_64-linux";
        modules = [
          chaotic-nyx.nixosModules.default
          ./configuration.nix
        ];
      };
    };
  }
