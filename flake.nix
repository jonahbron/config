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
	];
        fileSystems."/boot/" = {
          device = "/dev/mmcblk0p2";
          fsType = "ext4";
        };
        fileSystems."/" = {
          device = "/dev/mmcblk0p3";
          fsType = "ext4";
        };
        users.users.root = {
          initialPassword = "root";
        }
	services.openssh.enable = true;
      };
    };
  };
}
