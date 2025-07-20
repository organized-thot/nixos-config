{ ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.nix = import ./home.nix;
  };
}
