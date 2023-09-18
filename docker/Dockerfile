# Start with Alpine Linux
FROM alpine:latest

# Metadata
LABEL description="Docker container for taskd on Alpine Linux"

# Install dependencies. This might change depending on `taskd`'s requirements.
RUN apk -U --no-progress upgrade && \
  apk -U --no-progress add taskd taskd-pki

# Setup a volume for data persistence
VOLUME /var/taskd

# Expose the default taskd port
EXPOSE 53589

# Configure and run taskd
CMD ["taskd", "server", "--data", "/var/taskd"]

