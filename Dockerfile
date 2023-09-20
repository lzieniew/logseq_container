# Use linuxserver/docker-baseimage-kasmvnc as the base image
FROM ghcr.io/linuxserver/baseimage-kasmvnc:alpine318

# Update package database and install dependencies
RUN apk update \
    && apk add --no-cache wget unzip

# Download and extract Logseq
RUN wget https://github.com/logseq/logseq/releases/download/0.9.18/Logseq-linux-x64-0.9.18.zip \
    && unzip Logseq-linux-x64-0.9.18.zip -d /usr/local/bin

# Make the Logseq executable
RUN chmod +x /usr/local/bin/Logseq-linux-x64/Logseq

# Create a directory for Logseq notes and mount it as a volume
VOLUME [ "/logseq-notes" ]

# Expose the VNC port
EXPOSE 5900

# Start KasmVNC server and Logseq
CMD ["sh", "-c", "kasmvncserver"]

