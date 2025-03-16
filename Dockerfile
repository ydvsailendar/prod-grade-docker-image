# Use a minimal base image (Alpine)
FROM alpine:latest

# Install curl to make HTTP requests
RUN apk --no-cache add curl jq

# Create a directory for your app
WORKDIR /app

# Copy your script into the container
COPY github_status_check.sh /app/github_status_check.sh

# Make the script executable
RUN chmod +x /app/github_status_check.sh

# Set the default command to run your script continuously
CMD ["/bin/sh", "-c", "/app/github_status_check.sh"]
