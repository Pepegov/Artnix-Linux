{
  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "btrfs";
    options = [ "subvol=@root" "compress=zstd" "noatime" ];
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
  swapDevices = [
    {
      device = "/.swapvol/swapfile";
    }
  ];

  boot.initrd = {
    verbose = false;
    supportedFilesystems = [ "btrfs" ];
    kernelModules = [ "btrfs" ];
  };
}