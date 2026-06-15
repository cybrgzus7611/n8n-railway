FROM debian:bookworm-slim AS tools

RUN apt-get update && apt-get install -y \
    python3 python3-pip ffmpeg curl \
    && pip3 install yt-dlp --break-system-packages

FROM n8nio/n8n:latest

USER root

COPY --from=tools /usr/bin/ffmpeg /usr/bin/ffmpeg
COPY --from=tools /usr/bin/ffprobe /usr/bin/ffprobe
COPY --from=tools /usr/local/bin/yt-dlp /usr/local/bin/yt-dlp
COPY --from=tools /usr/bin/python3 /usr/bin/python3

RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

USER node
