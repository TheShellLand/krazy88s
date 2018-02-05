FROM ubuntu:16.04
MAINTAINER Eric Jaw <naisanza@gmail.com>


ADD ["https://downloads.plex.tv/plex-media-server/1.10.1.4602-f54242b6b/plexmediaserver_1.10.1.4602-f54242b6b_amd64.deb", "/tmp"]
#ADD ["plexmediaserver_1.10.1.4602-f54242b6b_amd64.deb", "/tmp"]


RUN \
# Install dependencies
    apt update && \
    apt install -y \
        wget \
        udev \
    && \

# Fix upstart dependency
    apt-get -y install \
        upstart-sysv \
        live-tools \
    && \
    update-initramfs -u && \
    apt-get purge -y systemd && \


# Install Plex
    dpkg -i "/tmp/plexmediaserver_1.10.1.4602-f54242b6b_amd64.deb" && \
    start plexmediaserver && \

# Cleanup dependencies
    rm "/tmp/plexmediaserver_1.10.1.4602-f54242b6b_amd64.deb" && \
    apt remove -y wget live-tools && \
    apt autoremove -y && \
    apt clean


# Entrypoint
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh


EXPOSE 32400


ENTRYPOINT ["/entrypoint.sh"]
