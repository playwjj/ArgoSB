FROM alpine:latest

# 更新包索引并安装基础包
RUN apk update && apk add --no-cache \
    bash \
    curl \
    supervisor \
    openssl \
    virt-what \
    iptables \
    sed \
    awk \
    grep \
    coreutils \
    base64 \
    util-linux \
    shadow \
    procps \
    tzdata \
    ca-certificates

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
