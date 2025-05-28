{ pkgs, ... }:
{
  nix.package = pkgs.nix;
  home.packages = [
    pkgs.docker-compose
    pkgs.librechat
  ];
}
{
  imports = [
    ./git.nix
  ];
}
