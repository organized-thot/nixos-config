{
  description = "screen-pipe with custom ffmpeg overlay";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs { 
        system = "x86_64-linux"; 
        overlays = [ (import ../overlays/ffmpeg-overlay.nix) ]; 
      };
    in {
      packages.x86_64-linux.screen-pipe = pkgs.screen-pipe;
    };
}
