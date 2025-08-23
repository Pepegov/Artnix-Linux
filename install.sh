#!/bin/bash

RED='\033[0;31m'
NOCOLOR='\033[0m'

echo "${RED}Partitioning of disk space${NOCOLOR}"
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount ./disco.nix --yes-wipe-all-disks
echo "${RED}Generate hardware config${NOCOLOR}"
sudo nixos-generate-config --root /mnt
echo "${RED}Copy configuration to /mnt/etc/nixos${NOCOLOR}"
sudo cp -r ./* /mnt/etc/nixos
sudo rm -rf /mnt/etc/nixos/.git
echo "${RED}Install nixos${NOCOLOR}"
sudo nixos-rebuild switch --flake /mnt/etc/nixos#vm