{ config, lib, pkgs, ... }:

{
    imports = [
        # include NixOS-WSL modules
        <nixos-wsl/modules>
    ];

    wsl.enable = true;
    wsl.defaultUser = "nixos";

    programs.nix-ld = {
        enable = true;
        package = pkgs.nix-ld-rs;
    };
}