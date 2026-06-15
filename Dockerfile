FROM n8nio/n8n:latest

USER root

RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

# Install ffmpeg and yt-dlp standalone binary (no Python needed)
RUN wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/local/bin/yt-dlp && \
    chmod a+rx /usr/local/bin/yt-dlp

USER node
