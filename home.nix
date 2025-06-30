# /etc/nixos/home.nix (Example content)
{ config, pkgs, ... }:

{
  # Example home-manager options for user 'nix'
  programs.zsh.enable = true;
  programs.git = {
    enable = true;
    userName = "Your Name";
    userEmail = "your.email@example.com";
  };
  # Add other programs, dotfiles, etc.
}
