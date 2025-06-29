{ config, lib, pkgs, inputs, ... }: # Add 'inputs' here as it's used below

{
  imports = [
    # Import hardware-configuration.nix
    ./hardware-configuration.nix

    # Import configuration.nix
    ./configuration.nix

    # Enable home-manager module (as a separate module, or inline as shown previously)
    # If home-manager.nix is a separate file with the correct module structure:
    ./home-manager.nix # Assuming home-manager.nix is in the same directory

    # If you prefer to enable home-manager inline in nixos.nix:
    ({ config, pkgs, ... }: {
      imports = [
        inputs.home-manager.nixosModules.home-manager
      ];
      home-manager.users.nix = {
        home.stateVersion = "25.05"; # Or your desired home-manager state version
        # If you have a separate home.nix for user configurations, you'd import it like:
        # imports = [ ./home.nix ];
      };
    })

    # Enable Garuda Nix Subsystem
    inputs.garuda.nixosModules.garudaLinux

    # Enable Chaotic Nyx repository
    inputs.chaotic.nixosModules.default
  ];

  # Define user account details here if not already in configuration.nix
  users.users.nix = {
    isNormalUser = true;
    password = "lazulinux"; # Consider using encrypted password or setting it post-install
  };
}
