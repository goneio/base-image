FROM mariadb:latest
LABEL maintainer="Matthew Baggett <matthew@baggett.me>" \
      org.label-schema.vcs-url="https://github.com/benzine-framework/docker" \
      org.opencontainers.image.source="https://github.com/benzine-framework/docker"

# Copy healthcheck file.
COPY health.sh /usr/bin/healthcheck
# Add healthcheck
HEALTHCHECK --interval=30s --timeout=3s \
  CMD /usr/bin/healthcheck

# Copy startup script across
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
