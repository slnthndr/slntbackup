#!/bin/bash

PIDFILE="/tmp/black_filter.pid"
BRIGHTNESS_FILE="/tmp/black_filter_brightness"
LOCATION="55.75:37.62"
TEMP="3500:3500"
RATE="1"
STEP=0.05

# Проверяем и читаем текущее значение яркости или ставим по умолчанию 0.5
if [ -f "$BRIGHTNESS_FILE" ]; then
  b=$(cat "$BRIGHTNESS_FILE")
else
  b=0.5
fi

# Функция запуска gammastep с текущим уровнем яркости
start_filter() {
  gammastep -l "$LOCATION" -t "$TEMP" -b "$b" -r "$RATE" &
  echo $! > "$PIDFILE"
}

# Функция сохранения значения яркости с ограничением в диапазоне [0.1, 1.0]
save_brightness() {
  # Ограничиваем яркость, чтобы она была минимум 0.1 и максимум 1.0
  if (( $(echo "$b < 0.1" | bc -l) )); then
    b=0.1
  elif (( $(echo "$b > 1.0" | bc -l) )); then
    b=1.0
  fi
  echo "$b" > "$BRIGHTNESS_FILE"
}

# Если передан параметр управления яркостью
if [ "$1" == "up" ]; then
  b=$(echo "$b + $STEP" | bc)
  save_brightness
  pkill -F "$PIDFILE"
  start_filter
  notify-send "Black Filter Brightness Increased" "Brightness: $b"

elif [ "$1" == "down" ]; then
  b=$(echo "$b - $STEP" | bc)
  save_brightness
  pkill -F "$PIDFILE"
  start_filter
  notify-send "Black Filter Brightness Decreased" "Brightness: $b"

else
  # Переключение фильтра вкл/выкл
  if [ -f "$PIDFILE" ]; then
    pkill -F "$PIDFILE"
    rm -f "$PIDFILE"
    notify-send -i night-light-disabled-symbolic -e "Black Filter Disabled"
  else
    start_filter
    echo "$b" > "$BRIGHTNESS_FILE"
    notify-send -i night-light-symbolic -e "Black Filter Enabled"
  fi
fi
