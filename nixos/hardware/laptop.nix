{ config, pkgs, ... }:

{
  imports = [
    ../bootloader/grub.nix
  ];

  # Здесь указываем видеодрайверы (важен порядок!)
  services.xserver.videoDrivers = [ "nvidia" "amdgpu" ];

  # Включаем поддержку PRIME offloading
  hardware.nvidia = {
    modesetting.enable = true;        # нужно для Xorg
    powerManagement.enable = true;    # управление питанием
    open = false;                     # лучше проприетарный драйвер
    prime = {
      offload.enable = true;          # разрешить offload
      offload.enableOffloadCmd = true; # даст команду `nvidia-offload`
    };
  };

  services.tlp.enable = true; # Для управления питанием

  # Если хотите CUDA
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;

  # Опционально: ускорение видео VA-API/VDPAU
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };
}