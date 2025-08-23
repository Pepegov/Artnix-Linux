{ config, pkgs, ... }:

{
  services.xserver.enable = true;

  services.xserver.windowManager.bspwm.enable = true;

  services.libinput = {
    enable = true;
    mouse.accelProfile = "flat";
    touchpad.accelProfile = "flat";
  };

}