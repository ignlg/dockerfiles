# run a tor relay in a container
FROM jess/tor-relay
MAINTAINER Ignacio Lago <ignacio@ignaciolago.com>

VOLUME /home/tor/.tor

USER root

COPY torrc.custom /etc/tor/torrc.custom

RUN apk update && apk add \
  sed \
  --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
  && rm -rf /var/cache/apk/*

# Configure custom rules
ADD config.sh /config.sh
ADD update_or_add.sh /update_or_add.sh
RUN sh /config.sh

# make sure files are owned by tor user
RUN chown -R tor /etc/tor

USER tor

ENTRYPOINT [ "tor" ]
