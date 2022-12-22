{ config, lib, pkgs, ... }:
{
  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;
  
  boot.initrd.availableKernelModules = lib.mkForce [ "usbhid" "md_mod" "raid0" "raid1" "raid10" "raid456" "ext2" "ext4" "sd_mod" "sr_mod" "mmc_block" "uhci_hcd" "ehci_hcd" "ehci_pci" "ohci_hcd" "ohci_pci" "xhci_hcd" "xhci_pci" "usbhid" "hid_generic" "hid_lenovo" "hid_apple" "hid_roccat" "hid_logitech_hidpp" "hid_logitech_dj" "hid_microsoft" "hid_cherry" ];
  boot.initrd.kernelModules = [];
  boot.kernelModules = [];
  boot.extraModulePackages = [];

  system.stateVersion = lib.traceSeq config.boot.initrd.availableKernelModules "23.05";
  
  fileSystems."/" = {
    device = "/dev/disk/by-partlabel/nixos";
    fsType = "ext4";
  };
  fileSystems."/boot" = {
    device = "/dev/disk/by-partlabel/boot";
  };
  swapDevices = [];
  networking = {
    hostName = "rock5b";
    useDHCP = false;
    networkmanager.enable = true;
  };
  powerManagement.cpuFreqGovernor = lib.mkDefault "ondemand";
  users.users.root.initialPassword = "root";
  services.openssh.enable = true;
  services.openssh.permitRootLogin = "yes";
}
