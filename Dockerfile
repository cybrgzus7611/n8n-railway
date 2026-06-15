FROM n8nio/n8n:latest

USER root

RUN wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp_linux -O /usr/local/bin/yt-dlp && \
    chmod a+rx /usr/local/bin/yt-dlp
