{
  description = "screen-pipe with custom ffmpeg overlay";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
  outputs = { self, nixpkgs }:
    let
      overlays = [ (import ./overlays/ffmpeg-overlay.nix) ];
      pkgs = import nixpkgs { system = "x86_64-linux"; overlays = overlays; };
    in {
      packages.x86_64-linux.screen-pipe = pkgs.screen-pipe;
    };
}
