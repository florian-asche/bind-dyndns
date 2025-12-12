# Dockerfile für bind-dyndns
FROM ubuntu:latest

# Installiere Cron, dnsutils und curl
RUN apt-get update && \
    apt-get -y install cron dnsutils curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Setze Cron auf Autostart
RUN echo "@reboot root /usr/sbin/cron" >> /etc/crontab

# Erstelle ein Arbeitsverzeichnis
RUN mkdir -p /app
WORKDIR /app

# Standard-Befehl (kann später überschrieben werden)
CMD ["tail", "-f", "/dev/null"]