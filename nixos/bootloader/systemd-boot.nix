{
  fileSystems."/" = {
    device = "/dev/disk/by-partlabel/root";
    fsType = "btrfs";
    options = [ "subvol=@root" "compress=zstd" "noatime" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-partlabel/ESP";
    fsType = "vfat";
  };

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

  boot.initrd = {
    verbose = false;
    supportedFilesystems = [ "btrfs" ];
    kernelModules = [ "btrfs" ];
  }
}