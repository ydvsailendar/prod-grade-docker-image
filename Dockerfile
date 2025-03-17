# Use a minimal, non-root base image for security
FROM python:3.11-alpine

# Create a non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Set working directory
WORKDIR /app

# Copy requirements and install dependencies as a non-root user
COPY requirements.txt .

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY . .

# Set permissions for the non-root user
RUN chown -R appuser:appgroup /app

# Switch to non-root user
USER appuser

# Expose the port
EXPOSE 4000

# Use a more secure command to run the application
CMD ["gunicorn", "--bind", "0.0.0.0:4000", "app:app"]
