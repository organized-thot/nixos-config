{
  description = "NixOS configuration with Garuda, Home Manager, and Chaotic Nyx";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    garuda.url = "gitlab:garuda-linux/garuda-nix-subsystem/stable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
  };

  outputs = { self, nixpkgs, home-manager, garuda, chaotic }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hardware-configuration.nix
        ./configuration.nix
        garuda.nixosModules.garuda
        chaotic.nixosModules.chaotic-nyx
        home-manager.nixosModules.home-manager
      ];
    };

    homeConfigurations.nix = home-manager.lib.homeConfiguration {
      system = "x86_64-linux";
      username = "nix";
      configuration = import /home/nix/.config/nixpkgs/home.nix;
    };
  };
}
