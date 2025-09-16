#!/bin/bash
count=$(yay -Qu | wc -l)
if [ "$count" -gt 0 ]; then
  echo "yay updates: $count"
else
  echo "yay up to date"
fi
