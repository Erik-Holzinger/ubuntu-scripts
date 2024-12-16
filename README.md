# ubuntu-scripts
This repository contains a collection of handy scripts for Ubuntu to enhance your workflow and system customization. Whether you're looking to automate simple tasks or tweak your desktop environment, these scripts can save you time and effort.

## switch-theme
This script switches between light and dark mode based on the current time to reduce eye strain.
It also provides the option of using two different background images for the respective light mode.

To provide the paths to the images please add the two system variables `MY_LIGHT_WALLPAPER` and `MY_DARK_WALLPAPER` to the `~/.profile` file.

The script changes the light mode by default at 8am and 6pm.
This can be adjusted directly in the script if required.

Furthermore, if `curl` and `jq` is installed, and the variables `MY_LAT`, `MY_LNG` and `MY_TZ` are defined, the script fetches the sunrise and sunset data from `https://sunrise-sunset.org` for switching the theme.

### Environment Variables
| Name               | Required | Description                                   | Example                      |
|--------------------|----------|-----------------------------------------------|------------------------------|
| MY_LIGHT_WALLPAPER | Yes      | Path to the light theme wallpaper             | /path/to/wallpaper_light.jpg |
| MY_DARK_WALLPAPER  | Yes      | Path to the dark theme wallpaper              | /path/to/wallpaper_dark.jpg  |
| MY_LAT             | No       | Latitude used for sunrise-sunset calculation  | 48.94658252682787            |
| MY_LNG             | No       | Longitude used for sunrise-sunset calculation | 11.404508314745836           |
| MY_TZ              | No       | Timezone used for sunrise-sunset calculation  | Europe/Berlin                |

### Using systemd
Service that executes the switch-theme.sh script.
```
[Unit]
Description=Switch between light and dark theme based on time.

[Service]
Type=oneshot
Environment="DISPLAY:0"
Environment="DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus"
ExecStart=/path/to/ubuntu-scripts/switch-theme.sh
```

Timer that executes the service every minute.
```
[Unit]
Description=Call the theme switcher periodically

[Timer]
OnCalendar=*-*-* *:*:00

[Install]
WantedBy=timers.target
```

## update-discord
Since discord does not provide an apt repository, this script can be used to download and install the latest deb package of Discord if a newer version is available.

For convince, a systemd trigger can be defined.
