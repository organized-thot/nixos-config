{
  description = "NixOS configuration with Home Manager, Chaotic Nyx, and Garuda Linux NixOS submodule enabled";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    garuda.url = "github:garuda-linux/garuda-nix-subsystem/stable";
#    chaotic-nyx.url = "github:chaotic-nyx/nyx/nyxpkgs-unstable";
#    screenpipe-flake.url = "git+file:///etc/nixos/screenpipe-flake";
  };

  outputs = { nixpkgs, garuda, chaotic-nyx, ... }: {
    nixosConfigurations.nixos = garuda.lib.garudaSystem {
      system = "x86_64-linux";
      modules = [
#        chaotic-nyx.nixosModules.default
        ./hardware-configuration.nix  # Explicit import
        ./configuration.nix
      ];
    };
  };
}
