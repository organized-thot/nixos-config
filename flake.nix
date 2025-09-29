{
  description = "NixOS flake v0.3 for personal system with Garuda Nix Subsystem, and numerous other imputs.";

  inputs = {
    nixpkgs-python.url = "https://flakehub.com/f/cachix/nixpkgs-python/1.2.0.tar.gz";
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.2505.810395.tar.gz";

    garuda = {
      url = "gitlab:garuda-linux/garuda-nix-subsystem/stable";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    fh.url = "https://flakehub.com/f/DeterminateSystems/fh/\*.tar.gz";

    hardware.url = "https://flakehub.com/f/NixOS/nixos-hardware/0.1.2295.tar.gz";

    flake-parts.url = "https://flakehub.com/f/hercules-ci/flake-parts/0.1.397.tar.gz";

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    nix-snapd = {
      url = "https://flakehub.com/f/nix-community/nix-snapd/0.1.62+rev-355a1ed0141b6fd3093e3cb7b3492e6e67913681.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    nixified-ai = {
      url = "https://flakehub.com/f/nixified-ai/flake/0.1.76.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    TagStudio = {
      url = "https://github.com/TagStudioDev/TagStudio/archive/refs/tags/v9.5.3.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

  };

  outputs =
    { self
    , hardware
    , nixpkgs
    , garuda
    , nur
    , fh
    , nix-snapd
    , nixified-ai
    , TagStudio
    , flake-parts
    , nixpkgs-python
    , ...
    }:
    let
      system = "x86_64-linux";

      # Overlay to fix tkinter build failure.
      # The tcl package needs libtommath in propagatedBuildInputs for other packages
      # (like python's tkinter) to find tommath.h.
      tkinter-fix-overlay = final: prev: {
        tcl = prev.tcl.overrideAttrs (old: {
          buildInputs = builtins.filter (p: p.pname != "libtommath") (old.buildInputs or [ ]);
          propagatedBuildInputs = (old.propagatedBuildInputs or [ ]) ++ [ prev.libtommath ];
        });
      };
    in
    {
      nixosConfigurations.nixos = garuda.lib.garudaSystem {
        inherit system;
        modules = [
          ./configuration.nix
          ({
            nixpkgs.overlays = [ tkinter-fix-overlay ];
          })
          nix-snapd.nixosModules.default
          {
            # snapd for NixOS            
            services.snap.enable = true;
          }
        ];
      };
    };
}
