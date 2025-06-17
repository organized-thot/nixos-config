{
  description = "NixOS with Garuda, Home Manager, and Chaotic AUR";

  inputs = {
    # NixOS unstable
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # home-manager module
    home-manager.url = "github:nix-community/home-manager";
    # Garuda Linux NixOS module
    garuda.url = "github:garuda-linux/garuda-nix-subsystem/stable";
    # Chaotic Nyx module
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
  };

  outputs = { self, nixpkgs, home-manager, garuda, chaotic }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # Import hardware-configuration.nix
          ./hardware-configuration.nix

          # Import configuration.nix
          ./configuration.nix

          # Enable home-manager
          ./home-manager.nix

          # Enable Garuda Nix Subsystem
          garuda.nixosModules.garudaLinux

          # Enable Chaotic Nyx repository
          chaotic.nixosModules.default
        ];
      };
    };
  };
}
