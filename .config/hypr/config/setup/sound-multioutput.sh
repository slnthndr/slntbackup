#!/bin/bash
# Загружаем модуль loopback для каждого устройства
pactl load-module module-loopback source=combined.monitor sink=alsa_output.usb-Logitech_G_series_G435_Wireless_Gaming_Headset_202105190004-00.analog-stereo
pactl load-module module-loopback source=combined.monitor sink=alsa_output.pci-0000_10_00.6.analog-stereo
