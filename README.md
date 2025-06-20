This repository contains the contents of my /etc/nixos directory, and tracks changes to my NixOS configuration as I learn how to use the system. 

Currently, some components include:
- KDE Plasma desktop
- home-manager enabled (in-progress)
- Garuda Linux NixOS submodule (in-progress)
- Chaotic Nyx repository (in-progress)
- Flatpak service

My primary goals at the moment are:
- Create a working configuration and get a better grasp on the role flakes and modules should play in the system.
- Understand the interaction between the Nix Packages ecosystem and other package managers and package formats.
-   So far, it seems like NixOS supports a lot of package formats; I've been able to run Flatpaks and AppImages successfully (albeit with a lot of glitches that seem to be gtk-related).
-   The Nixpkgs repository seems to have substantially fewer GUI applications than others, like the AUR or apt sources.
-   I don't understand why this is the case, and it's unclear to me whether there is an optimal way to navigate alternate package sources on NixOS.
- Because there seem to be numerous ways to make nearly any package run on NixOS, whether by way of a container, sandbox, virtual environment, or other means, I would like to have a unified package manager/app store with filterable, up-to-date listings of all available packages.
