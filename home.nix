{
  config,
  pkgs,
  ...
}: {
  home.username = "nix";
  home.homeDirectory = "/home/nix";
}
