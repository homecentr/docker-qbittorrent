#!/usr/bin/env ash

echo "Whoam I: $(whoami)"

# Ensure the config directory exists
mkdir -p /config/qBittorrent

# Copy default config if none exists
if [[ ! -e /config/qBittorrent/qBittorrent.conf ]]
then
    cp /defaults/qBittorrent.conf /config/qBittorrent/qBittorrent.conf
fi

/usr/bin/qbittorrent-nox --webui-port=8080