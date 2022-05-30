FROM        rust:1-alpine3.15

WORKDIR     /app

RUN         apk add --no-cache --update bash iproute2 git sqlite sqlite-dev python3 python3-dev ca-certificates tzdata zip tar curl g++ make && adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]