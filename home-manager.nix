# This file is meant to be imported as a NixOS module
{ config, pkgs, ... }:

{
  home-manager.users.nix = { pkgs, ... }: {
    imports = config.garuda.home-manager.modules or [];

# Custom Home Manager settings

    programs.zsh.enable = true;
    programs.git = {
      enable = true;
      userName = "Organized Thot";
      userEmail = "189394231+organized-thot@users.noreply.github.com";
    };

    # Additional custom Home Manager modules and settings

    home.stateVersion = "25.05";
  };
}
