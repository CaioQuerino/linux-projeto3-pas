FROM ubuntu:latest

WORKDIR /app

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    build-essential \
    apache2 \
    wget \
    unzip \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

COPY criar_scripts.sh /app/criar_scripts.sh

RUN chmod +x /app/criar_scripts.sh

CMD ["/app/criar_scripts.sh"]