FROM ubuntu:bionic

LABEL maintainer="Matthew Baggett <matthew@baggett.me>"

ENV DEBIAN_FRONTEND="teletype" \
    TERM=xterm-256color \
    COMPOSER_ALLOW_SUPERUSER=1 \
    COLOUR_FAIL='\e[31m' \
    COLOUR_SUCCESS='\e[32m' \
    COLOUR_NONE='\e[39m' \
    DEFAULT_TZ='Europe/London'

CMD ["runsvdir", "-P", "/etc/service"]

WORKDIR /app
ENV PATH="/app:/app/bin:/app/vendor/bin:${PATH}"

COPY installers /installers
COPY etc /etc
COPY usr /usr

RUN /installers/install && \
    rm -rf /marshall /installers
