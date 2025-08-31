#!/bin/sh

echo "Partitioning of disk space"
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount ./disco.nix --yes-wipe-all-disks

#echo "Generate hardware config"
#sudo nixos-generate-config --root /mnt

echo "Copy configuration to /mnt/etc/nixos"
sudo cp -r ./* /mnt/etc/nixos
sudo rm -rf /mnt/etc/nixos/.git

echo "Install nixos"
sudo nixos-install --flake /mnt/etc/nixos#vm
#sudo nixos-rebuild switch --flake /mnt/etc/nixos#vm
#nixos-enter --root /mnt