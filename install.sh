sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount ./disko.nix
sudo rm -rf /etc/nixos/*
sudo cp -r ./* /etc/nixos
sudo rm -rf /etc/nixos/.git
sudo nixos-generate-config
sudo nixos-rebuild switch --flake /etc/nixos#vm