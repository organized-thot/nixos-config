{
  description = "screen-pipe with custom ffmpeg overlay";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    ffmpeg-overlay.url = "path:../overlays/ffmpeg-overlay.nix";
  };

  outputs = { self, nixpkgs, ffmpeg-overlay }:
    let
      pkgs = import nixpkgs { 
        system = "x86_64-linux"; 
        overlays = [ ffmpeg-overlay.overlays.default ]; 
      };
    in {
      packages.x86_64-linux.screen-pipe = pkgs.screen-pipe;
    };
}
