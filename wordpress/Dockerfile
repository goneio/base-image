FROM benzine/php:nginx
COPY nginx.runit /etc/service/nginx/run
RUN wget -O /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x /etc/service/nginx/run \
             /usr/local/bin/wp \
    && \
    echo "alias wp=\"wp --allow-root\"" >> /etc/bash.bashrc && \
    wp --allow-root --version
