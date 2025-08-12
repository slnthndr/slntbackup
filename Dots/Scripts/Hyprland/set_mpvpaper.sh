#!/bin/bash
CONF="$HOME/.config/hypr/hyprland.conf"
MONITOR="DP-2" # Поменяйте на ваш реальный монитор, посмотрите `hyprctl monitors`
WALLPAPER="$1"

# Удаляем старые строки с swww и mpvpaper
sed -i '/exec-once = swww/d' "$CONF"
sed -i '/exec-once = mpvpaper/d' "$CONF"

# Добавляем новую строку для автозапуска mpvpaper с нужным видео
echo "exec-once = mpvpaper --output=$MONITOR $WALLPAPER" >>"$CONF"
