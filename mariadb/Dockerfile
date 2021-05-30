FROM mariadb:10.6
# Copy healthcheck file.
COPY health.sh /usr/bin/healthcheck
# Add healthcheck
HEALTHCHECK --interval=30s --timeout=3s \
  CMD /usr/bin/healthcheck

# Copy startup script across
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
