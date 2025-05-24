{ pkgs, ... }:
{
  nix.package = pkgs.nix;
  home.packages = [ pkgs.lan-mouse_git ];
}
{
  imports = [
    ./git.nix
  ];
}