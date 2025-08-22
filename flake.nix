{
  description = "Artnix configuration";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    polymc.url = "github:PolyMC/PolyMC";
  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, ... }@inputs:

    let
      system = "x86_64-linux";
    in {

    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      specialArgs = {
        pkgs-stable = import nixpkgs-stable {
          inherit system;
          config.allowUnfree = true;
        };
        inherit inputs system;
      };
      modules = [
        ./nixos/configuration.nix
        ./nixos/hardware/laptop.nix # Специфичные для ноута настройки (NVIDIA, power management)
      ];
    };


    nixosConfigurations.vm = nixpkgs.lib.nixosSystem {
      specialArgs = {
        pkgs-stable = import nixpkgs-stable {
          inherit system;
          config.allowUnfree = true;
        };
        inherit inputs system;
      };
      modules = [
        ./nixos/configuration.nix
        ./nixos/hardware/vm.nix    # Настройки для VM (отключение всего ненужного)
        ({ modulesPath, ... }: {
          imports = [ (modulesPath + "/virtualisation/qemu-vm.nix") ];
        })
      ];
    };

    homeConfigurations.pepegov = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [ ./home-manager/home.nix ];
    };
  };
}
