[![Project status](https://badgen.net/badge/project%20status/stable%20%26%20actively%20maintaned?color=green)](https://github.com/homecentr/docker-qbittorrent/graphs/commit-activity) [![](https://badgen.net/github/label-issues/homecentr/docker-qbittorrent/bug?label=open%20bugs&color=green)](https://github.com/homecentr/docker-qbittorrent/labels/bug) [![](https://badgen.net/github/release/homecentr/docker-qbittorrent)](https://hub.docker.com/repository/docker/homecentr/qbittorrent)
[![](https://badgen.net/docker/pulls/homecentr/qbittorrent)](https://hub.docker.com/repository/docker/homecentr/qbittorrent) 
[![](https://badgen.net/docker/size/homecentr/qbittorrent)](https://hub.docker.com/repository/docker/homecentr/qbittorrent)

[![CI/CD](https://github.com/homecentr/docker-qbittorrent/actions/workflows/ci_cd.yml/badge.svg)](https://github.com/homecentr/docker-qbittorrent/actions/workflows/ci_cd.yml)


# Homecentr - qbittorrent
Docker image of qBittorrent based on [LinuxServer.io's image](https://fleet.linuxserver.io/image?name=linuxserver/qbittorrent) just with removed bells and whistles which I do not consider secure - LSIO requires SET_UID, SET_GID and other capabilities. It also generally relies on running as root which I am not comfortable with and therefore this image runs strictly as a non-root user.

## Exposed ports

| Port | Protocol | Description |
|------|------|-------------|
| 8080 | TCP | WebUI |

## Volumes

| Container path | Description |
|------------|---------------|
| /config | qBittorrent configuration and state |
| /downloads | Downloaded files from the torrents |

## Security
The container is regularly scanned for vulnerabilities and updated. Further info can be found in the [Security tab](https://github.com/homecentr/docker-qbittorrent/security).

### Container user
The container uses UID:GID of 1000:1000 by default. Image must be rebuilt in case you need to use a different UID or GID due to file permissions.