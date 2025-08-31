{
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    
    systemd-boot = {
      enable = true;
      consoleMode = "auto";     
    };

    grub.enable = false;           
    timeout = 5;
  };
}