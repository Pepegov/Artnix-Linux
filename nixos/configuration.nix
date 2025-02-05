{ ... }:

{
  imports = [
    ./packages.nix
    #./wsl.nix
  ];

  disabledModules = [
    ./wsl.nix
  ];

  networking.hostName = "artnix"; # Define your hostname.
  time.timeZone = "Europe/Moscow"; # Set your time zone.
  i18n.defaultLocale = "en_US.UTF-8"; # Select internationalisation properties.
  nix.settings.experimental-features = [ "nix-command" "flakes" ]; # Enabling flakes
  system.stateVersion = "24.05";
}
