#!/bin/bash

DEVICE1="alsa_output.usb-Logitech_G_series_G435_Wireless_Gaming_Headset_202105190004-00.analog"
COMBINED="combined_sink"

CURRENT=$(pactl get-default-sink)

if [ "$CURRENT" = "$DEVICE1" ]; then
  pactl set-default-sink "$COMBINED"
  notify-send "Аудио" "Вывод на два устройства включен"
else
  pactl set-default-sink "$DEVICE1"
  notify-send "Аудио" "Вывод только на первое устройство"
fi
