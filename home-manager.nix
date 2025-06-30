# This file is meant to be imported as a NixOS module
{ config, pkgs, ... }:

{
  home-manager.users.nix = { pkgs, ... }: {
    home.stateVersion = "25.05";
    programs.zsh.enable = true;
    programs.git = {
      enable = true;
      userName = "Organized Thot";
      userEmail = "189394231+organized-thot@users.noreply.github.com";
    };
  };
}
