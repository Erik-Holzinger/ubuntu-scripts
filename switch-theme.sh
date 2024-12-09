#!/bin/bash

START_HOUR=8
END_HOUR=18

current_hour=$(date +%H)

if [[ "$current_hour" -ge "$START_HOUR" && "$current_hour" -le "$END_HOUR" ]]; then
  gsettings set org.gnome.desktop.background picture-uri "file://$MY_LIGHT_WALLPAPER"
  gsettings set org.gnome.desktop.interface color-scheme 'default'
else
  gsettings set org.gnome.desktop.background picture-uri-dark "file://$MY_DARK_WALLPAPER"
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
fi

