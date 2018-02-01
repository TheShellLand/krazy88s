FROM ubuntu:16.04
MAINTAINER Eric Jaw <naisanza@gmail.com>


# Default options
ARG StrictNodes=0


# Environment variables
# TODO: Add all TOR configuration options
ENV SocksPort "${SocksPort}"
ENV ExitNodes "${ExitNodes}"
ENV StrictNodes "${StrictNodes}"
ENV ExcludeExitNodes "${ExcludeExitNodes}"


# Always enable StrictNodes if ExitNodes are specified
RUN if [ ! -z "${ExitNodes}" ]; then StrictNodes=1; fi


# Create TOR configuration file
RUN echo SocksPort "${SocksPort}"               > tor.conf
RUN echo ExitNodes "${ExitNodes}"               >> tor.conf
RUN echo StrictNodes "${StrictNodes}"           >> tor.conf
RUN echo ExcludeExitNodes "${ExcludeExitNodes}" >> tor.conf


# Install build dependencies
RUN apt update && \
    apt install -y wget gcc make libevent-dev libssl-dev openssl


# Build TOR from source and cleanup
RUN tmp="/tmp/tor"          && \
    tor="$tmp/tor.tar.gz"   && \
    mkdir -p $tmp           && \
    cd $tmp                 && \
    wget -O $tor https://www.torproject.org/dist/tor-0.3.2.9.tar.gz && \
    tar --gz -xf $tor       && \
    cd tor*                 && \
    ./configure             && \
    make install            && \
    rm -rf $tmp


# Cleanup dependencies
RUN apt remove -y wget gcc make
RUN apt clean


# Create unprivileged user
RUN useradd -m tor -c "tor user"
RUN mv -v tor.conf /usr/local/etc/tor/torrc


EXPOSE 9050

ENTRYPOINT su - tor -c "tor"
