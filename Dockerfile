FROM alpine:latest

RUN apk add --no-cache bash curl supervisor

# 安装 cloudflared
RUN curl -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 \
    -o /usr/local/bin/cloudflared \
 && chmod +x /usr/local/bin/cloudflared

WORKDIR /app

RUN mkdir -p /etc/supervisor.d

ENV PORT=
ENV UUID=
ENV TUNNEL_DOMAIN=
ENV TUNNEL_TOKEN=

# 拷贝本地脚本和 supervisor 配置
COPY argosb.sh /app/argosb.sh
COPY argosb-supervisor.sh /app/argosb-supervisor.sh
COPY supervisord.conf /etc/supervisord.conf

RUN chmod +x /app/argosb.sh /app/argosb-supervisor.sh

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
