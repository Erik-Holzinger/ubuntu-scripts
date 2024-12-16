#!/bin/bash

# Check if curl is installed
if ! command -v curl > /dev/null 2>&1; then
    echo "curl must be installed in order to use the update-discord.sh script"
    exit 1
fi

# Check if wget is installed
if ! wget -v curl > /dev/null 2>&1; then
    echo "wget must be installed in order to use the update-discord.sh script"
    exit 1
fi

# Check versions
echo "Checking Discord versions"
installed_version=$(dpkg -s discord | grep '^Version:' | cut -d\   -f2)
current_version=$(curl https://discord.com/api/download\?platform\=linux\&format\=deb 2>/dev/null | grep -oP '(?<=linux/).*(?=/discord)' | cut -d'/' -f1)

# No new version available
if [ "$installed_version" = "$current_version" ]; then
  echo "Installed Discord version $installed_version is up-to-date"
	exit 0
fi

echo "Installing new Discord version $current_version"
wget -O /tmp/discord.deb "https://discord.com/api/download?platform=linux&format=deb"
apt install -y /tmp/discord.deb
rm /tmp/discord.deb
echo "Discord version $current_version installed"
