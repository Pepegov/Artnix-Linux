sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount ./disco.nix --yes-wipe-all-disks
sudo nixos-generate-config --root /mnt
echo "Copy configuration to /mnt/etc/nixos"
sudo cp -r ./* /mnt/etc/nixos
sudo rm -rf /mnt/etc/nixos/.git
sudo nixos-rebuild switch --flake /mnt/etc/nixos#vm