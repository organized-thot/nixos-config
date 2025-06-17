# Enable home-manager
home-manager.nixosModules.home-manager {
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.users.nix = {
        home = {
            homeDirectory = "/home/nix";
            username = "nix";
            configuration = home-manager.lib.homeManagerConfiguration {
                system = "x86_64-linux";
                username = "nix";
                homeDirectory = "/home/nix";
                configuration = import ./home.nix;
                pkgs = nixpkgs;
            };
        };
    };
}
