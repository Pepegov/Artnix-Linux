sudo rm -rf /etc/nixos/*
sudo cp -r ./* /etc/nixos
sudo rm -rf /etc/nixos/.git
sudo nixos-generate-config
sudo nixos-rebuild switch --flake /etc/nixos#vm