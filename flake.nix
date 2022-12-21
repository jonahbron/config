{
  description = "A very basic flake";
  
  nixConfig = {
    extra-substituters = ["https://rock5b-nixos.cachix.org"];
    extra-trusted-public-keys = ["rock5b-nixos.cachix.org-1:bXHDewFS0d8pT90A+/YZan/3SjcyuPZ/QRgRSuhSPnA="];
  };

  inputs = {
    rock5b-nixos.url = "github:aciceri/rock5b-nixos";
    nixpkgs.follows = "rock5b-nixos/nixpkgs";
  };

  outputs = { self, nixpkgs, rock5b-nixos }: {
    nixosConfigurations = {
      rock5b = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        modules = [
          rock5b-nixos.nixosModules.kernel
          rock5b-nixos.nixosModules.fan-control
          ./modules/system.nix
        ];
      };
    };
  };
}
