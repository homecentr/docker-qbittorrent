FROM linuxserver/qbittorrent:4.4.3

ARG USER_UID=1000
ARG USER_GID=1000

COPY ./root/ /

RUN mkdir -p /downloads && \
    rm -rf /etc/cont-init.d && \
    rm -rf /etc/services.d && \
    deluser guest && \
    deluser abc && \
    delgroup users && \
    addgroup --gid ${USER_GID} nonroot && \
    adduser -u ${USER_UID} -G nonroot -D -H -g "" nonroot && \
    chown ${USER_UID} /config && \
    chgrp ${USER_GID} /config && \
    chown ${USER_UID} /downloads && \
    chgrp ${USER_GID} /downloads && \
    chown -R ${USER_UID} /defaults && \
    chgrp -R ${USER_GID} /defaults && \
    chmod a+x /entrypoint.sh && \
    echo "WebUI\AuthSubnetWhitelistEnabled=true" >> /defaults/qBittorrent.conf && \
    echo "WebUI\AuthSubnetWhitelist=0.0.0.0/0" >> /defaults/qBittorrent.conf 

EXPOSE 8080
VOLUME "/config"
VOLUME "/downloads"

USER 1000:1000

ENTRYPOINT [ "ash", "entrypoint.sh" ]