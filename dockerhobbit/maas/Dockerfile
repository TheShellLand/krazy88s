FROM ubuntu:16.04
MAINTAINER Eric Jaw <naisanza@gmail.com>


# Install maas
RUN apt get update && \
    apt install -y maas


# Create maas user
RUN mass createadmin


# Login to the MAAS UI at http://<your.maas.ip>:5240/MAAS/
EXPOSE 5240


ENTRYPOINT ["/bin/bash -c"]
