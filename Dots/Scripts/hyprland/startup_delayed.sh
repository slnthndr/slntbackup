#!/bin/zsh
# Подождать 3 секунды
sleep 1

# Перезапустить службы
systemctl --user restart pipewire pipewire-pulse xdg-desktop-portal xdg-desktop-portal-hyprland

# Подождать ещё немного (опционально)
sleep 1

# Восстановить связи PipeWire
bash ~/Dots/Scripts/pwlinks_restore.sh
