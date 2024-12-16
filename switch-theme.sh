#!/bin/bash

# Check if sunrise-sunset API should be used
if command -v curl >/dev/null 2>&1 && command -v jq >/dev/null 2>&1 && [ -n "$MY_LAT" ] && [ -n "$MY_LNG" ] && [ -n "$MY_TZ" ]; then
  JSON_RESPONSE=$(curl -s "https://api.sunrise-sunset.org/json?lat=${MY_LAT}&lng=${MY_LNG}&date=today&formatted=0")

  SUNRISE_UTC=$(echo "$JSON_RESPONSE" | jq -r '.results.sunrise')
  SUNSET_UTC=$(echo "$JSON_RESPONSE" | jq -r '.results.sunset')

  START=$(TZ=${MY_TZ} date -d "$SUNRISE_UTC" '+%s')
  END=$(TZ=${MY_TZ} date -d "$SUNSET_UTC" '+%s')
else
  START=8
  END=18
fi

NOW=$(date +%s)

if [ "$NOW" -ge "$START" ] && [ "$NOW" -le "$END" ]; then
  gsettings set org.gnome.desktop.background picture-uri "file://$MY_LIGHT_WALLPAPER"
  gsettings set org.gnome.desktop.interface color-scheme 'default'
else
  gsettings set org.gnome.desktop.background picture-uri-dark "file://$MY_DARK_WALLPAPER"
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
fi
