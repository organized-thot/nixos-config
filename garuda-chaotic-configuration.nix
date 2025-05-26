{ ... }: {
  # Your hardware configuration
  imports = [ ./hardware-configuration.nix ];

  # Hostname
  networking.hostName = "yourmachine";

  # Enabling the dr460nized desktop version
  # as well as the linux-cachyos kernel and gaming
  # options and applications
  garuda = {
    dr460nized.enable = true;
    gaming.enable = true;
    performance-tweaks = {
      cachyos-kernel = true;
      enable = true;
    };
  };
}
