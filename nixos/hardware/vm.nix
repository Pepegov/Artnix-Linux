{ config, pkgs, ... }:

{
  # Явно ОТКЛЮЧАЕМ всё, что не нужно в VM
  hardware.nvidia.prime.enable = false;

  # Можем использовать другой видеодрайвер
  services.xserver.videoDrivers = [ "modesetting" ]; 

  # Отключаем ненужные в VM сервисы
  services.tlp.enable = false;
  services.power-profiles-daemon.enable = false;

  # Увеличиваем лимит памяти для QEMU, если нужно
  virtualisation.graphics = false; # Если не нужен графический вывод из VM
}