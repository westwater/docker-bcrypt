FROM alpine:3.9

MAINTAINER "Westwater (https://github.com/westwater)"

RUN apk add --no-cache apache2-utils bash

COPY "${PWD}/run.sh" "/run.sh"

ENTRYPOINT ["/run.sh"]