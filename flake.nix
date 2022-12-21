{
  description = "A very basic flake";
  
  nixConfig = {
    extra-substituters = ["https://rock5b-nixos.cachix.org"];
    extra-trusted-public-keys = ["rock5b-nixos.cachix.org-1:bXHDewFS0d8pT90A+/YZan/3SjcyuPZ/QRgRSuhSPnA="];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/f2537a505d45c31fe5d9c27ea9829b6f4c4e6ac5";
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
