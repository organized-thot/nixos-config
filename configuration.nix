
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
      efiSupport = true;
      devices = [ "nodev" ];
      useOSProber = true;
    };
  };

# Locale
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
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
  };

# Time zone
  time.timeZone = "America/Chicago";

# Networking
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

# Virtualisation
  virtualisation = {
    podman.enable = true;
    docker.enable = true;
  };

# Nix Settings
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
      "https://chaotic-cx.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "chaotic-cx.cachix.org-1:gFRsEiK5fIKiP5/MEHEO4aY2QT5xOoQ6RqhlZ8U219Q="
    ];
  };

  nyx.chaoticEnabled = true;

# Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
    permittedUnfreePackages = [
      "vivaldi"
      "windsurf"
    ];
    permittedInsecurePackages = [ 
      "python3.13-django-3.1.14"
      "electron-27.3.11"
    ];
  };

# System Packages
  environment.systemPackages = with pkgs; [
    tailscale
    kasmweb
    screen-pipe
  # Nix-related tools
    home-manager
    disko
    nixfmt-tree
    rippkgs
    nixpkgs-manual
  # Libraries and other dependencies
    dmidecode
    fwupd
    ffmpeg-full
    gdb
  # Package sources
    # Python
    python3
    python3Packages.yarg
    # Node.js
    nodejs_24
    pnpm
    # Flatpak
    flatpak
    kdePackages.discover
    # PackageKit
    packagekit
    # AppImage
    libappimage
    appimage-run 
    appimageupdate
  # Disk management    
    os-prober
    disko
    timeshift
  # Display and desktop environment
    kdePackages.wayland
    kdePackages.plasma-wayland-protocols
    wayland-utils
  # Desktop Utilities
    kdePackages.plasma-nm
    kdePackages.yakuake
    kdePackages.konqueror
  # Command-line tools
    git
    gh
    bat
    wget
    phantomsocks
    docker
    tldr
  # Search
    kdePackages.baloo
    kdePackages.milou
    meilisearch
  ];

# Users
  users.users.nix = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    packages = with pkgs; [
    # User Packages
      vivaldi
      telegram-desktop
      protege-distribution
      home-assistant
    # KDE Software
      kdePackages.kbookmarks
      kdePackages.keditbookmarks
      kdePackages.akonadi
      kdePackages.zanshin
      kdePackages.purpose
      # kdePackages.umbrello # marked as broken      
      kdePackages.libkgapi
    # PKM Tools
      obsidian
      logseq
      affine
      tana
      karakeep
    # Web Scraping
      eget
      curl
      curlie
      wcurl
      curl-impersonate
      httpie
      katana
      scraper
      schemacrawler
      xcrawl3r
      crawley
      python3Packages.firecrawl-py    
      archivebox
      nodePackages.tiddlywiki
    # AI
      ollama
      local-ai
      n8n
      fabric-ai
      neo4j
      neo4j-desktop   
      open-webui
      mongodb
      
    # PyPi Packages
      python313Packages.markitdown
    # AI Tools
      python3Packages.huggingface-hub
      python3Packages.langchain
      python3Packages.langchain-huggingface
      python3Packages.llama-index
      python3Packages.llama-index-embeddings-huggingface
      python3Packages.firecrawl-py
#      python3Packages.gensim
#      python3Packages.graphrag

    # Containerization
      distrobox
      distrobox-tui
      podman
      podman-tui
      podman-desktop
    ];
  };

# Some programs need SUID wrappers, can be configured further or are started in user sessions.

  programs.firefox.enable = true;

  programs.mtr.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

# Enable Garuda dr460nized desktop
  garuda.dr460nized.enable = true;

  security.rtkit.enable = true;

# Services
  services = {
  # Desktop environment
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
    xserver = {
      enable = true; # Enable the X11 windowing system
      xkb.layout = "us"; # Configure X11 keymap
    };

  # Audio
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

  # Touchpad support (enabled default in most desktopManager).
    # services.libinput.enable = true;

  # D-Bus Daemon  
    dbus.enable = true;

  # Tailscale
    tailscale.enable = true;

  # OpenSSH daemon
    openssh.enable = true;

  # Flatpak support
    flatpak.enable = true;

  # Printing via CUPS
    printing.enable = true;

  # Meilisearch
    meilisearch.enable = true;

  # AI Tools
    mongodb = {
      enable = true;
      user = "nix";
    };

    n8n = {
      enable = true;
      openFirewall = true;
    };

    neo4j.enable = true;

    ollama.enable = true;  

    open-webui.enable = true;

  # TiddlyWiki
    tiddlywiki.enable = true;

  # Karakeep
    karakeep.enable = true;
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

