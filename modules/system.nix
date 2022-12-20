{ confsig, lib, pkgs, ... }:
{
  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;
  
  boot.initrd.availableKernelModules = ["usbhid"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = [];
  boot.extraModulePackagec = [];
  
  fileSystems."/boot/" = {
    device = "/dev/disk/by-uuid/3BCD-BDE8";
    fsType = "ext4";
  };
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/a8d4ac6c-7fd7-47d5-9ce3-c9cd2361acc0b";
    fsType = "ext4";
  };
  swapDevices = [];
  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "ondemand";
  hardware.video.hidpi.enable = lib.mkDefault true;
  users.users.root = {
    initialPassword = "root";
  }
  services.openssh.enable = true;
}
