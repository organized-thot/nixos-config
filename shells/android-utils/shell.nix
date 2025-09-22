let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-unstable";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShellNoCC {
  packages = with pkgs; [

  # ADB
    python313Packages.adb-enhanced #   Tool for Android testing and development
    python313Packages.adb-homeassistant #  Pure python implementation of the Android ADB and Fastboot protocols
    haskellPackages.adb #  Android Debug Bridge (ADB) protocol
    haskellPackages.android #  Android methods exposed to Haskell
    adbfs-rootless #  Mount Android phones on Linux with adb, no root required
    adbtuifm #    TUI-based file manager for the Android Debug Bridge
    dcnnt #  UI-less tool to connect Android phone with desktop
    gnirehtet #  Reverse tethering over adb for Android

  # FILESYSTEM
    otadump #  Command-line tool to extract partitions from Android OTA files
    python313Packages.liblp #  Android logical partitions library ported from C++ to Python
    go-mtpfs #  Simple FUSE filesystem for mounting Android devices as a MTP device
    jmtpfs #  FUSE filesystem for MTP devices like Android phones
    androguard #  Tool and Python library to interact with Android Files
    python313Packages.androguard 

  # ANDROID STUDIO
    android-studio #  Official IDE for Android (stable channel)
    android-studio-tools #  Android Studio CLI Tools
    androidStudioPackages.stable #  Official IDE for Android (stable channel)

  # ANDROID SDK
    androidsdk #  Android SDK tools, packaged in Nixpkgs
    androidenv.test-suite #  Android SDK tools, packaged in Nixpkgs
    android-tools #  Android SDK platform tools

  # ANDROID NDK
    androidndkPkgs.binaries #  Android NDK toolchain, tuned for other platforms
    androidndkPkgs.binutils #  Android NDK toolchain, tuned for other platforms (wrapper script)
    androidndkPkgs.libraries
    
  # SAMSUNG FIRMWARE
    heimdall #  Cross-platform open-source tool suite used to flash firmware onto Samsung Galaxy devices
    heimdall-gui #  Cross-platform open-source tool suite used to flash firmware onto Samsung Galaxy devices
    samfirm-js #  Program for downloading Samsung firmware

  # BOOT
    abootimg #  Manipulate Android Boot Images
    avbroot #  Sign (and root) Android A/B OTAs with custom keys while preserving Android Verified Boot
    imgpatchtools #  Tools to manipulate Android OTA archives
    waydroid #  Container-based approach to boot a full Android system on a regular GNU/Linux system
  
  # SYNCHRONIZATION
    adb-sync #  Tool to synchronise files between a PC and an Android devices using ADB (Android Debug Bridge)
    python313Packages.pysyncthru #  Automated JSON API based communication with Samsung SyncThru Web Service
    rquickshare #  Rust implementation of NearbyShare/QuickShare from Android for Linux and macOS
    android-file-transfer #  Reliable MTP client with minimalistic UI

  # BACKUP
    python313Packages.android-backup #  Unpack and repack android backups
    android-backup-extractor #  Utility to extract and repack Android backups created with adb backup

  # APK UTILITIES
    apkid #  Android Application Identifier
    fdroidserver #  Server and tools for F-Droid, the Free Software repository system for Android
    koodousfinder #  Tool to allows users to search for and analyze Android apps
    android-translation-layer #  Translation layer that allows running Android apps on a Linux system

  # SYSTEM TOOLS
    mvt #  Tool to facilitate the consensual forensic analysis of Android and iOS devices
    snapdragon-profiler #  Profiler for Android devices running Snapdragon chips
    android-udev-rules #  Android udev rules list aimed to be the most comprehensive on the net
    universal-android-debloater #  Tool to debloat non-rooted Android devices

  # DISPLAY
    scrcpy #  Display and control Android devices over USB or TCP/IP
    qtscrcpy #  Android real-time display control software

  # MISCELLANEOUS
    alp #  Convenient authentication method that lets you use your android device as a key for your Linux machin
    python313Packages.pydroid-ipcam #  Python library for Android IP Webcam
    python313Packages.pyfcm # Python client for FCM - Firebase Cloud Messaging (Android, iOS and Web)        
    selendroid #  Test automation for native or hybrid Android apps and the mobile web
  ];
}
