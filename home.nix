{ config, pkgs, ... }:

{
  home.username = "nix";
  home.homeDirectory = "/home/nix";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    htop
    helix
    # add more user-only packages here
  ];

  # Optional: shell aliases, themes, etc.
  programs.zsh.enable = true;
}
