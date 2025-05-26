{
  description = "My configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    garuda.url = "gitlab:garuda-linux/garuda-nix-subsystem/stable";
  };

  outputs = { garuda, nixpkgs, ... }: {
    nixosConfigurations = {
      hostname = garuda.lib.garudaSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix # Your system configuration.
        ];
      };
    };
  };
}
