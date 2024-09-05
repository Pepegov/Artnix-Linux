{ pkgs, ... }:

{
    nixpkgs.config = {
        permittedInsecurePackages = ["python-2.7.18.8"];
    };

    environment.systemPackages = with pkgs; [
        # Coding 
        glibc
        coreutils
        gnumake
        gcc
        nodejs
        python
        python3

        # CLI utils
        wget
        git
        fastfetch
        htop
        zip
        unzip
        lux
        ntfs3g
        openssl
        bluez
        bluez-tools

        # Other
        home-manager
  ];  

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];
}