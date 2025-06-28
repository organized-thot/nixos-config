{ config, lib, pkgs, ... }:

{
  imports = [
    # Import hardware-configuration.nix
    ./hardware-configuration.nix

    # Import configuration.nix
    ./configuration.nix

    # Enable home-manager module
    ({ config, pkgs, ... }: {
      imports = [
        # This brings home-manager options into the NixOS configuration
        # which is necessary for setting up users and enabling the service.
        inputs.home-manager.nixosModules.home-manager
      ];
      home-manager.users.nix = {
        home.stateVersion = "25.05"; # Or your desired home-manager state version
        # You can define home-manager options directly here or import a home.nix
        # For simplicity, if you have a separate home.nix for user configurations, you'd import it like:
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
