# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, pkgs, ... }:

{
  # Bootloader for Windows dual boot (GRUB + EFI)
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      version = 2;
      efiSupport = true;
      devices = [ "nodev" ];
      useOSProber = true;
    };
  };

  # Users
  users.users.nix = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
#   packages = with pkgs; [
#     tree
#   ];

  };

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Internationalisation
  il8n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
    useXkbConfig = true; # use xkb.options in tty.
  };

  # Enable networking
  networking.networkmanager.enable = true; # Enables wireless support via wpa_supplicant.
  networking.hostName = "nixos";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable flakes and nix-command
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Desktop environment
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.xserver.enable = true; # Enable the X11 windowing system
  services.xserver.xkb.layout = "us"; # Configure X11 keymap

  # Enable Garuda dr460nized desktop
  garuda.dr460nized.enable = true;

  # Enable Pipewire audio
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

# SERVICES

  # Enable CUPS to print documents
  services.printing.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

# PACKAGES

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    os-prober
    git
    wget
    bat    
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.firefox.enable = true;
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?

}

