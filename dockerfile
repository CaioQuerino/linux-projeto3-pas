FROM ubuntu:latest

WORKDIR /app

COPY requirements.txt /app/requirements.txt

RUN apt-get update && \
    xargs -a /app/requirements.txt apt-get install -y && \
    rm -rf /var/lib/apt/lists/*

COPY criar_scripts.sh /app/criar_scripts.sh

RUN chmod +x /app/criar_scripts.sh

CMD ["/app/criar_scripts.sh"]