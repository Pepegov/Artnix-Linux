{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.xkb.layout = "us";
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.windowManager.bspwm.enable = true;

  # sxhkd: минимальная конфигурация биндов
  services.sxhkd = {
    enable = true;
    keybindings = {
      "super + Return" = "alacritty";
      "super + d" = "dmenu_run";
      "super + q" = "bspc node -c";

      # Фокус по стрелкам
      "super + {Left,Down,Up,Right}" = "bspc node -f {west,south,north,east}";

      # Перемещать окна
      "super + shift + {Left,Down,Up,Right}" = "bspc node -s {west,south,north,east}";

      # Рабочие столы
      "super + {1-9}" = "bspc desktop -f {1-9}";
    };
  };

  # Polybar (минимальная конфигурация)
  services.polybar = {
    enable = true;
    config = {
      "bar/main" = {
        width = "100%";
        height = "24pt";
        background = "#222";
        foreground = "#dfdfdf";
        modules-left = "xworkspaces";
        modules-center = "date";
        modules-right = "pulseaudio battery";
      };

      "module/xworkspaces" = { type = "internal/xworkspaces"; };
      "module/date" = { type = "internal/date"; interval = 5; date = "%Y-%m-%d %H:%M"; };
      "module/pulseaudio" = { type = "internal/pulseaudio"; };
      "module/battery" = { type = "internal/battery"; battery = "BAT0"; };
    };
  };

  services.libinput = {
    enable = true;
    mouse.accelProfile = "flat";
    touchpad.accelProfile = "flat";
  };

}