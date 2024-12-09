# ubuntu-scripts
This repository contains a collection of handy scripts for Ubuntu to enhance your workflow and system customization. Whether you're looking to automate simple tasks or tweak your desktop environment, these scripts can save you time and effort.

## switch-theme
This script switches between light and dark mode based on the current time to reduce eye strain.
It also provides the option of using two different background images for the respective light mode.

To provide the paths to the images please add the two system variables `MY_LIGHT_WALLPAPER` and `MY_DARK_WALLPAPER` to the `~/.profile` file.

The script changes the light mode by default at 8am and 6pm.
This can be adjusted directly in the script if required.

