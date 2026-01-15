{
  description = "My Neovim configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      nvf,
    }:
    let
      forEachSystem =
        function:
        nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed (
          system:
          function {
            pkgs = nixpkgs.legacyPackages.${system};
            inherit system;
          }
        );
    in
    {
      devShells = forEachSystem (
        { pkgs, system }:
        {
          default = pkgs.mkShellNoCC {
            packages = [
              pkgs.hello
              self.packages.${system}.default
            ];
          };
        }
      );
      packages = forEachSystem (
        { pkgs, system }:
        {
          default =
            (nvf.lib.neovimConfiguration {
              modules = [ ./neovim.nix ];
              inherit pkgs;
            }).neovim;
        }
      );
    };
}
