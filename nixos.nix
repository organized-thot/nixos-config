# ...
imports = [
  ./hardware-configuration.nix
  ./configuration.nix
  ./home-manager.nix # Import the home-manager module

  inputs.garuda.nixosModules.garudaLinux
  inputs.chaotic.nixosModules.default
];
# ...
