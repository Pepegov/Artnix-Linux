{ pkgs, ... }:

{
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        # Desctop apps
        discord
        gparted
        obsidian
        telegram-desktop
        firefox

        # Coding 
        glibc
        coreutils
        gnumake
        gcc
        nodejs
        python
        python3
        docker
#        dotnetCorePackages.sdk_9
#        dotnetCorePackages.runtime_9
#        rider

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

        # Xorg
        xterm
        xclip
        xorg.xbacklight

        # Windows manger and windows tools
        bspwm
        polybar
#        xfce4-clipman
        gammastep
        picom

        # Sound
        pipewire
#        pipewire-pulse
        pipewire-alsa
        wireplumber
        pulseaudio


        # Other
        home-manager
  ];  

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
  ];
}