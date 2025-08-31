{
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    
    systemd-boot = {
      enable = true;
      consoleMode = "auto";     
    };

    grub.enable = false;           
    timeout = 5;
  };
}