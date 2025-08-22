{ config, pkgs, ... }:

{
  services.xserver.enable = true;

  # Указываем какой WM/DE нужен
  services.xserver.windowManager.bspwm.enable = true;

  services.xserver.libinput = {
    enable = true;
    mouse.accelProfile = "flat";
    touchpad.accelProfile = "flat";
  };

}