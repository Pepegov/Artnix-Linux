{ pkgs, ... }: {
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;

    users.pepegov = {
      isNormalUser = true;
      description = "Pepegov";
      extraGroups = [ "networkmanager" "wheel" "input" "libvirtd" "docker" ];
      packages = with pkgs; [];
    };
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "pepegov";
}
