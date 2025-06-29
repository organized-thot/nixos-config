# This file is meant to be imported as a NixOS module
{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.nix = {
    home.homeDirectory = "/home/nix";
    home.username = "nix";
    home.stateVersion = "25.05"; # Or match your system.stateVersion

    # If you have a separate home.nix for user configurations
    imports = [ ./home.nix ]; # Assuming home.nix is in the same directory as this file
  };
}
