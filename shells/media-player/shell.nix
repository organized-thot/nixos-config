let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-unstable";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShellNoCC {
  packages = with pkgs; [
    libmicrodns #   Minimal mDNS resolver library, used by VLC
    gnupnp #  Implementation of the UPnP specification
    gnupnp-tools #  Set of utilities and demos to work with UPnP
    libupnp #  Open source UPnP development kit for Linux
    minissdpd #  Small daemon to speed up UPnP device discoveries
    miniupnpc #  Client that implements the UPnP Internet Gateway Device (IGD) specification
    miniupnod #  Daemon that implements the UPnP Internet Gateway Device (IGD) specification
    python313Packages.upnpy #  UPnP client library for Python
    yaup #  Yet Another UPnP Portmapper
    upnp-router-control #  Access some parameters of the router and manage port forwarding

		python313Packages.samsungtvws #   Samsung Smart TV WS API wrapper
    python313Packages.samsungctl #  Remote control Samsung televisions via a TCP/IP connection

    rygel #   Home media solution (UPnP AV MediaServer) that allows you to easily share audio, video and pictures to other devices
    serviio #  UPnP Media Streaming Server
    ums #   Universal Media Server: a DLNA-compliant UPnP Media Server

		fcast-client #   FCast Client Terminal, a terminal open-source media streaming client
		fcast-receiver #   FCast Receiver, an open-source media streaming receiver

    python313Packages.PyChromecast #   Library for Python to communicate with the Google Chromecast
    go2tv #   Cast media files to UPnP/DLNA Media Renderers and Smart TVs
 		castnow #   Command-line Chromecast player
 		go-chromecast #   CLI for Google Chromecast, Home devices and Cast Groups
		mkchromecast #   Cast macOS and Linux Audio/Video to your Google Cast and Sonos Devices
		nodePackages.castnow #   Command-line Chromecast player
#		owntone #   Media server to stream audio to AirPlay and Chromecast receivers
		pulseaudio-dlna #   Lightweight streaming server which brings DLNA / UPNP and Chromecast support to PulseAudio and Linux
 		catt #   Send media from online sources to Chromecast devices
 		fx-cast-bridge #   Implementation of the Chrome Sender API (Chromecast) within Firefox
		python313Packages.casttube #   Interact with the Youtube Chromecast api

		vlc
		libvlc  #Cross-platform media player and streaming server
		libvlcpp #   Header-only C++ bindings for the libvlc crossplatform multimedia API
		python313Packages.python-vlc
		python313Packages.aiovlc
  ];
}
