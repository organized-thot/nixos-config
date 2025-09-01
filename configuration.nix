# Edit this configuration file to define what should be installed on your system. 
# Help is available in: 
# - the configuration.nix(5) man page, 
# - on https://search.nixos.org/options, and 
# - in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{

  imports = [ 
    ./hardware-configuration.nix # Produced by nixos-generate-config
  ];

# LINUX KERNEL AND BOOTLOADER 

  boot = { 
    loader = { # Set bootloader options
      grub = { # Grub with EFI support, and OSProber enabled for Windows dual boot
        enable = true;
        efiSupport = true;
        devices = [ "nodev" ];
        useOSProber = true;
      };
      # systemd-boot.enable = true; # Configuration options for systemd bootloader
      # efi.canTouchEfiVariables = true;
    };
    kernelModules = [ "nvidia_x11" ]; 
      # From hwinfo output:
      #   module alias: 
      #     pci:v000010DEd00001BBBsv00001028sd00000832bc03sc00i00
      #   PCI ID:
      #     10DE:1BBB
      # From the [PCI ID Repository](https://admin.pci-ids.ucw.cz/read/PC/10de/1bbb)
      #   Vendor (10de): 
      #     NVIDIA Corporation 
      #   Device Name (for device ID 1bbb): 
      #     GP104GLM [Quadro P3200 Mobile]
    blacklistedKernelModules = [ "nouveau" ]; # Disable nouveau (open-source NVIDIA GPU driver).
  };
  
# HARDWARE

  hardware = {
    nvidia = { # Configure support for NVIDIA Quadro P3200 GPU 
      enabled = true;
      driverVersion = "580.78.05"; # (Based on [results of NVIDIA's hardware compatibility list](https://www.nvidia.com/en-us/drivers/details/252613/)
      modesetting.enable = true;
      nvidiaSettings = true;
      powerManagement.enable = false;
      prime = { # NVIDIA Optimus hybrid graphics
        offload.enable = true;
        offload.enableOffloadCmd = true;
        intelBusId = "PCI:0:0:2";
        nvidiaBusId = "PCI:0:1:0";
      };
    };
    graphics.enable = true; # Enable opengl
  };

# FILESYSTEMS

  fileSystems."/" = {
    device = "/dev/dm-0";
    fsType = "ext4";
  };

  swapDevices = [
    { label = "swap"; }
  ];

# NETWORKING

  networking = {
    hostName = "nixos"; # Define your hostname.
    networkmanager.enable = true; # Configure network connections interactively with nmcli or nmtui.
    firewall = {
      enable = true;
#     allowedTCPPorts = [ ... ];
#     allowedUDPPorts = [ ... ];
    };
#   proxy = { # Configure network proxy if necessary
#     default = "http://user:password@proxy:port/";
#     noProxy = "127.0.0.1,localhost,internal.domain";
#   };
  };

# LOCALE AND TIMEZONE

  time.timeZone = "America/Chicago"; # Set your time zone.
  i18n.defaultLocale = "en_US.UTF-8"; # Select internationalisation properties.
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
    useXkbConfig = true; # use xkb.options in tty.
  };

# NIX SETTINGS

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
#      substituters = [
#        "https://chaotic-cx.cachix.org"
#        "https://cache.nixos.org"
#        "https://nix-community.cachix.org"
#      ];
#      trusted-public-keys = [
#       "chaotic-cx.cachix.org-1:gFRsEiK5fIKiP5/MEHEO4aY2QT5xOoQ6RqhlZ8U219Q="
#       "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
#       "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
#      ];
#    package = pkgs.nix;
    };
  };

  garuda.dr460nized.enable = true; # Enable Garuda dr460nized desktop

# SERVICES

  services = {

  # System and external device-related services
    libinput.enable = true; # Touchpad support (enabled default in most desktopManager).
    openssh.enable = true; # Enable the OpenSSH daemon
    pipewire = { # Enable sound using Pipewire
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    # pulseaudio.enable = true; # Alternatively, enable sound using PulseAudio
    printing.enable = true; # Enable printing via CUPS

  # Display, graphics, and desktop environment
    xserver = { # X11 options
      enable = true; # Enable the X11 windowing system
      xkb.layout = "us"; # Configure X11 keymap
      videoDrivers = [ "modesetting" "nvidia" ];    
    };
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
    desktopManager.plasma6.enable = true;
    dbus.enable = true; # D-Bus Daemon  
    
    flatpak.enable = true; 

  # Enable self-hosted programs that run web services
    karakeep = {
      enable = true;
      meilisearch.enable = true;
      browser = {
        enable = true;
      };
    };
    meilisearch = {
      enable = true;
      settings.experimental_dumpless_upgrade = true;
    };
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
    tailscale.enable = true;
    tiddlywiki.enable = true;
  };

# PROGRAM CONFIGURATIONS (Some programs need SUID wrappers, can be configured further or are started in user sessions.)

  programs = {
    appimage = {
      enable = true;
      binfmt = true;
    };
    firefox.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    mtr.enable = true; # Network diagnostics tool

    tailscale.enable = true;

# VIRTUALIZATION

  virtualisation = {
    podman.enable = true;
    docker.enable = true;
  };

# USER CONFIG

  users.users.nix = { # Define a user account. Don't forget to set a password with ‘passwd’.
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    packages = with pkgs; [
       #ai
        aichat # Use GPT-4(V), Gemini, LocalAI, Ollama and other LLMs in the terminal
        aider-chat-full      
        fabric-ai # Fabric is an open-source framework for augmenting humans using AI. It provides a modular framework for solving specific problems using a crowdsourced set of AI prompts that can be used anywhere.
        gemini-cli # AI agent that brings the power of Gemini directly into your terminal
        litellm # Use any LLM as a drop in replacement for gpt-3.5-turbo. Use Azure, OpenAI, Cohere, Anthropic, Ollama, VLLM, Sagemaker, HuggingFace, Replicate (100+ LLMs)
        lmstudio # LM Studio is an easy to use desktop app for experimenting with local and open-source Large Language Models (LLMs)
        local-ai # OpenAI alternative to run local LLMs, image and audio generation
        mistralclient # OpenStack Mistral Command-line Client
        mods # AI on the command line
        n8n
        ollama # Get up and running with large language models locally
        open-webui # Comprehensive suite for LLMs with a user-friendly WebUI
        oterm # Text-based terminal client for Ollama
        screen-pipe

       #containerization
        distrobox
        distrobox-tui
        podman
        podman-tui
        podman-desktop

       #git
        committed
        deepgit
        eget  
        gh
        git-aggregator
        git-annex
        git-branchless
        git-dive 
        git-filter-repo
        git-relevant-hsitory
        git-annex

       #network
        mosh # Mobile shell (SSH replacement)
        home-assistant
        i2p # Applications and router for I2P, anonymity over the Internet
        i2pd # Minimal I2P router written in C++
        i2pd-tools # Toolsuite to work with keys and eepsites
        phantomsocks

       #pkm   
        affine
        chrome-export
        karakeep
        logseq
        mindforger
        obsidian
        protege-distribution
        tana
        nodePackages.tiddlywiki
        
       #web
        browsh
        chrome-export       
        grayjay # Cross-platform application to stream and download content from various sources
        telegram-desktop
        offpunk
        vivaldi
    
        crawley
        curl
        curlie # Frontend to curl that adds the ease of use of httpie, without compromising on features and performance
        httpie
        katana # Next-generation crawling and spidering framework
        muffet # Website link checker which scrapes and inspects all pages in a website recursively
        scraper # Tool to query HTML files with CSS selectors
        spider # Web crawler and scraper, building blocks for data curation workloads
        schemacrawler
        xcrawl3r

       #other
        chafa # Terminal graphics for the 21st century
        ffmpeg-full
        mongodb
        neo4j
        neo4j-desktop  
        tldr
    ];
    packages = with pkgs.python3Packages; [
        firecrawl-py
        gensim
        git-filter-repo
        graphrag
        huggingface-hub
        langchain
        langchain-huggingface
        litellm # Use any LLM as a drop in replacement for gpt-3.5-turbo. Use Azure, OpenAI, Cohere, Anthropic, Ollama, VLLM, Sagemaker, HuggingFace, Replicate (100+ LLMs)
        llama-index
        llama-index-embeddings-huggingface
        llm-ollama # LLM plugin providing access to Ollama models using HTTP API
        markitdown
        mistral-common # mistral-common is a set of tools to help you work with Mistral models.
        ollama # Ollama Python library
   ];

   packages = with pkgs.kdePackages; [
       akonadi
       alpaka # Kirigami client for ollama
       baloo
       kbookmarks
       keditbookmarks
       konqueror
       libkgapi
       milou
       plasma-nm
       purpose
       umbrello # marked as broken
       yakuake
       zanshin
    ];
  };

# SYSTEM PACKAGES

  environment.systemPackages = with pkgs; [
   #required
    dmalloc
    dmidecode
    fwupd
    gdb
    klibcShrunk
    linuxKernel.packages.linux_6_16.nvidia_x11_latest_open
    stdenv
    python3Packages.aiohttp # Asynchronous HTTP Client/Server for Python and asyncio
    python3Packages.cython # Optimising static compiler for both the Python and the extended Cython programming languages

   #other
    git
    bat
    wget
    docker
    tailscale
    kasmweb

   #disks    
    os-prober
    disko
    timeshift

   #nixos
    home-manager
    disko
    rippkgs
    nixpkgs-manual

   #display
    wayland-utils
    weston
    wl-clipboard # wayland clopboard

   #package-management
    #Python
    python3
    python3Packages.yarg
    #Node.js
    nodejs_24
    pnpm
    #Flatpak
    flatpak
    kdePackages.discover
    #PackageKit
    packagekit
    #AppImage
    libappimage
    appimage-run 
    appimageupdate
  ];

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
  system.stateVersion = "25.11"; # Did you read the comment?
}

