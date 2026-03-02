{
  description = "Custom Fluxer Nix package";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    fluxer-src = {
      url = "github:fluxerapp/fluxer?ref=refactor";
      flake = false;
    };
  };

  outputs = {
    nixpkgs,
    fluxer-src,
    ...
  }: let
    systems = [
      "x86_64-linux"
      "aarch64-linux"
    ];
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    packages = forAllSystems (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in {
        fluxer = pkgs.callPackage ./pkgs/fluxer {
          inherit fluxer-src;
        };
      }
    );
  };
}
