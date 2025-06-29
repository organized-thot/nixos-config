# ...
imports = [
  ./hardware-configuration.nix
  ./configuration.nix
  ./home-manager.md # Import the home-manager module

  inputs.garuda.nixosModules.garudaLinux
  inputs.chaotic.nixosModules.default
];
# ...
