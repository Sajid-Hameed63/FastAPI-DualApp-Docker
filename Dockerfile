# Use the lightweight Python Alpine base image
FROM python:3.11-alpine

# Install required dependencies
RUN apk update && apk add --no-cache \
    gcc \
    libc-dev \
    libffi-dev \
    py3-setuptools \
    py3-pip \
    py3-wheel \
    supervisor

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the supervisord configuration file
COPY supervisord.conf /etc/supervisord.conf

# Expose the ports the FastAPI apps will run on
EXPOSE 8000 8001

# Start supervisord to run both apps
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
