let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-unstable";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShellNoCC {
  packages = with pkgs; [

  # mDNS
    mdns #  Public domain mDNS/DNS-SD library in C
    mdns-scanner #  Scan a network and create a list of IPs and associated hostnames, including mDNS hostnames and other aliases
    nssmdns #  MDNS Name Service Switch (NSS) plug-in
    python313Packages.aiohttp-asyncmdnsresolver #  Module to resolve mDNS with aiohttp
    # AVAHI (Required for usbmuxd2 Wi-Fi connection)
    avahi #  mDNS/DNS-SD implementation
    avahi-compat #  mDNS/DNS-SD implementation
    python313Packages.avahi #  mDNS/DNS-SD implementation

  # USBMUXD
    usbmuxd #  Socket daemon to multiplex connections from and to iOS devices
    libusbmuxd #  Client library to multiplex connections from and to iOS devices
    usbmuxd2 #  Socket daemon to multiplex connections from and to iOS devices
    libgeneral #  Helper library used by usbmuxd2
    usbfluxd #  Redirects the standard usbmuxd socket to allow connections to local and remote usbmuxd instances so remote devices appear connected locally

  # iOS DEVICE CONNECTION
    libimobiledevice #  Software library that talks the protocols to support iPhone®, iPod Touch® and iPad® devices on Linux
    libimobiledevice-glue #  Library with common code used by the libraries and tools around the libimobiledevice project
    ifuse
    ideviceinstaller #  List/modify installed apps of iOS devices
    idevicerestore #  Restore/upgrade firmware of iOS devices
    libideviceactivation #  Library to manage the activation process of Apple iOS devices
    ifuse
    sharing #  Command-line tool to share directories and files to mobile devices

  # DEVICE CONTROL
    gammu #  Command line utility and library to control mobile phones  
    micromdm #  Mobile Device Management server for Apple Devices, focused on giving you all the power through an API

    ios-safari-remote-debug
    ios-webkit-debug-proxy

    checkra1n
    rcodesign  
    xpwn 

    bark-server
   

  ];
}
