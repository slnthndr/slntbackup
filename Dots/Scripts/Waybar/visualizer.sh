#!/bin/bash
export XDG_RUNTIME_DIR=/run/user/$(id -u)
export PULSE_RUNTIME_PATH=/run/user/$(id -u)/pulse
stdbuf -oL /usr/bin/cava -p /home/slnt/.config/cava/config | while read -r line; do
    echo "$line"
done
