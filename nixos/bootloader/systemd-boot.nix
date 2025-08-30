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

    grub.enable = false;           # Disable grub GRUB
    timeout = 5;
  };

  # Btrfs
  boot.kernelParams = [
    "root=LABEL=root"           
    "rootflags=subvol=@root"    
    "quiet"                     
  ];

  boot.initrd.verbose = false;
  boot.consoleLogLevel = 0;
}