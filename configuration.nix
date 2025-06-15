# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ config, lib, pkgs, ... }:
let
  username = "nix";
in
# BOOTLOADER
{
  boot.loader = {
    systemd-boot.enable = false;  # Ensure systemd-boot is off
    grub = {
      enable = true;
      version = 2;
      efiSupport = true;
      devices = [ "nodev" ];  # Use nodev for EFI systems
      useOSProber = true;    # Enables Windows detection
    };
  };
}

#  boot.loader.efi.canTouchEfiVariables = true;
#  boot.initrd.luks.devices."luks-af0953e8-4082-4b8e-be3b-d147df43a908".device = "/dev/disk/by-uuid/af0953e8-4082-4b8e-be3b-d147df43a908";

# NETWORKING
  # Enable networking
  networking.networkmanager.enable = true;

  # Set hostname
  networking.hostName = "nixos";

  # Enable wireless support via wpa_supplicant.
  # networking.wireless.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

# LOCALE AND TIME ZONE
  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

# NIXOS OPTIONS
  # Enable flakes
  nix.settings.experimental-features.enable = [ "nix-command" "flakes" ];

  # Enable Garuda NixOS module
  garuda.enable = true;

  # Enable ChaoticNyx repository
  chaotic.enable = true;
  chaotic.enableNyx = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "electron-27.3.11"
    "python3.12-django-3.1.14"
  ];

# DESKTOP ENVIRONMENT
  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Enable the X11 windowing system
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable Wayland
  services.wayland.enable = true;

# HARDWARE AND DEVICES
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

# USERS
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nix = {
    passwd = "lazulinux";
    isNormalUser = true;
    description = "nix";
    extraGroups = [ "networkmanager" "wheel" ];
    homeManager.enable = true;
  };

# SYSTEM PACKAGES
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = [
    pkgs.os-prober
    pkgs.home-manager
    pkgs.nixfmt-tree
    pkgs.rippkgs
    pkgs.rippkgs-index
    pkgs.nixpkgs-manual
    pkgs.git
    pkgs.dbus-launch
    pkgs.fwupd
    pkgs.dmidecode
    pkgs.kdePackages.wayland
    pkgs.kdePackages.plasma-wayland-protocols
    pkgs.wayland-utils
    pkgs.libsForQt5.qt5.qtwayland
    pkgs.gdb
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
