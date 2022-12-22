After building and booting a disk image from here:

https://github.com/aciceri/rock5b-nixos

And creating an ESP FAT32 partition labeled `boot`, and an EXT4 partition
labeled `nixos`.

Then configure the system from this flake with this command.

```
sudo mkdir /mnt
sudo mount /dev/disks/by-partlabel/nixos /mnt
sudo mkdir /mnt/boot
sudo mount /dev/disks/by-partlabel/boot /mnt/boot
sudo nixos-install --flake github:jonahbron/config#rock5b
```
