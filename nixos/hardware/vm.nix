{ config, pkgs, ... }:

{
  imports = [
    ../bootloader/grub.nix
  ];

  # Можем использовать другой видеодрайвер
  services.xserver.videoDrivers = [ "modesetting" ]; 

  # Отключаем ненужные в VM сервисы
  services.tlp.enable = false;
  services.power-profiles-daemon.enable = false;

  # Увеличиваем лимит памяти для QEMU, если нужно
  #virtualisation.graphics = false; # Если не нужен графический вывод из VM
}