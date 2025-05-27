{
  description = "NixOS with Garuda, Home Manager, and Chaotic AUR";

  inputs = {
    # Use NixOS unstable
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home Manager for user environment
    home-manager.url = "github:nix-community/home-manager";

    # Garuda Linux NixOS module
    garuda.url = "github:garuda-linux/garuda-nix-subsystem/stable";

    # Chaotic Nyx module
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

  };

  outputs = { self, nixpkgs, home-manager, garuda, chaotic }: {
    # Define NixOS system configuration
    nixosConfigurations.nixos = {
      nixos = nixpkgs.lib.nixosSystem;
      garuda = garuda.lib.garudaSystem;
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        ./hardware-configuration.nix
        home-manager.nixosModules.home-manager
        chaotic.nixosModules.chaotic-nyx
      ];
    };

    # Define Home Manager configuration
    homeConfigurations.nix = home-manager.lib.homeConfiguration {
      system = "x86_64-linux";
      username = "nix";
      configuration = import /home/nix/.config/nixpkgs/home.nix;
    };
  };
}
