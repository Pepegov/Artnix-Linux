sudo rm -rf /etc/nixos/*
sudo cp ./* /etc/nixos
sudo rm -rf /etc/nixos/.git
sudo nixos-generate-config --dir /etc/nixos/nixos
sudo nixos-rebuild switch --flake .#nixos