#!/bin/bash
sleep 3
# Файл со списком линков
LINKS_FILE="$HOME//Dots/Options/pw-links.txt"

while IFS= read -r line; do
  pw-link $line
done <"$LINKS_FILE"
