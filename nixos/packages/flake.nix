{
  description = "A collection of packages used by Ash";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = nixpkgs.lib.systems.flakeExposed;

      perSystem = { pkgs, lib, ... }: {
        legacyPackages = {
          dudu-calligraphy = pkgs.callPackage ./pkgs/fonts/dudu-calligraphy { };
        };
      };
    };
}
