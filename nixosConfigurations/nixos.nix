{ inputs, ... }@flakeContext:
let
  nixosModule = { config, lib, pkgs, ... }: {
    config = {
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
      users.users.nix = {
        isNormalUser = true;
        password = "lazulinux";
      };
    };
  };
in
	inputs.nixpkgs.lib.nixosSystem {
	  modules = [
	    nixosModule
	  ];
	  system = "x86_64-linux";
	};
	inputs.garuda.lib.garudaSystem {
	  system = "x86_64-linux";
	  modules = [
	    configuration.nix
	  ];
	};
      };
}
