{ config, pkgs, ... }:

{
  services.xserver.enable = true;

  # Здесь указываем видеодрайверы (важен порядок!)
  services.xserver.videoDrivers = [ "nvidia" "amdgpu" ];

  # Указываем какой WM/DE нужен
  services.xserver.windowManager.bspwm.enable = true;

  services.xserver.libinput = {
    enable = true;
    mouse.accelProfile = "flat";
    touchpad.accelProfile = "flat";
  };

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

  # Если хотите CUDA
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;

  # Опционально: ускорение видео VA-API/VDPAU
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
}