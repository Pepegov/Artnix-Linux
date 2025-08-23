#!/bin/sh

RED="\033[31m"
RESET="\033[0m"

printf "%sPartitioning of disk space%s\n" "$RED" "$RESET"
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount ./disco.nix --yes-wipe-all-disks

printf "%Generate hardware config%s\n" "$RED" "$RESET"
sudo nixos-generate-config --root /mnt

printf "%Copy configuration to /mnt/etc/nixos%s\n" "$RED" "$RESET"
sudo cp -r ./* /mnt/etc/nixos
sudo rm -rf /mnt/etc/nixos/.git

printf "%Install nixos%s\n" "$RED" "$RESET"
sudo nixos-rebuild switch --flake /mnt/etc/nixos#vm