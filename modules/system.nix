{ confsig, lib, pkgs, ... }:
{
  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;
  
  boot.initrd.availableKernelModules = lib.mkForce [ "usbhid" "md_mod" "raid0" "raid1" "raid10" "raid456" "ext2" "ext4" "sd_mod" "sr_mod" "mmc_block" "uhci_hcd" "ehci_hcd" "ehci_pci" "ohci_hcd" "ohci_pci" "xhci_hcd" "xhci_pci" "usbhid" "hid_generic" "hid_lenovo" "hid_apple" "hid_roccat" "hid_logitech_hidpp" "hid_logitech_dj" "hid_microsoft" "hid_cherry" ];
  boot.initrd.kernelModules = [];
  boot.kernelModules = [];
  boot.extraModulePackages = [];

  system.stateVersion = "23.05";
  
  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/3BCD-BDE8";
    fsType = "ext4";
  };
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/a8d4ac6c-7fd7-47d5-9ce3-c9cd2361acc0b";
    fsType = "ext4";
  };
  swapDevices = [];
  networking.useDHCP = lib.mkDefault true;
  networking.hostName = "box";
  nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "ondemand";
  hardware.video.hidpi.enable = lib.mkDefault true;
  users.users.root.initialPassword = "root";
  services.openssh.enable = true;
}
