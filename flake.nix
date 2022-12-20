{
  description = "A very basic flake";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/";
    rock5b-nixos.url = "github:aciceri/rock5b-nixos";
  };

  outputs = { self, nixpkgs, rock5b-nixos }:
  let
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      box = lib.nixosSystem {
        system = "aarch64-linux";
        modules = [
	  rock5b-nixos.nixosModules.kernel
	  ./modules/system.nix
	];
      };
    };
  };
}
