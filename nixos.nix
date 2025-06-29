{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./configuration.nix

    inputs.home-manager.nixosModules.home-manager

    ({ config, pkgs, ... }: {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.nix = {
        home.homeDirectory = "/home/nix";
        home.username = "nix";
        home.stateVersion = "25.05";
        # If you have specific home-manager user config in /etc/nixos/home.nix
        imports = [ ./home.nix ];
      };
    })

    inputs.garuda.nixosModules.garudaLinux
    inputs.chaotic.nixosModules.default
  ];

  users.users.nix = {
    isNormalUser = true;
    password = "lazulinux";
  };
}
