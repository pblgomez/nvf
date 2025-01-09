{
  description = "My Neovim configuration";
  inputs = {
    nvf.url = "github:notashelf/nvf";
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    systems.url = "github:nix-systems/default";
  };
  outputs = { nixpkgs, nvf, systems, ... }:
    let forEachSystem = nixpkgs.lib.genAttrs (import systems);
    in {
      packages = forEachSystem (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          customNeovim = nvf.lib.neovimConfiguration {
            modules = [ ./neovim.nix ];
            inherit pkgs;
          };
        in rec {
          default = customNeovim.neovim;
          neovim = default;
        });
    };
}
