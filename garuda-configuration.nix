{ ... }: {
  # Your hardware configuration
  imports = [ ./hardware-configuration.nix ];

  # Hostname
  networking.hostName = "nixos";

  # Enabling the dr460nized desktop version
  garuda = {
    dr460nized.enable = true;
  };
}
