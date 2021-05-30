# From upstream redis
FROM redis:latest
# Add healthcheck
HEALTHCHECK --interval=30s --timeout=3s \
  CMD redis-cli PING 