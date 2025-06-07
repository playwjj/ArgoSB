#!/bin/bash

# 检查是否存在 cloudflared
if ! command -v cloudflared &> /dev/null; then
    echo "[ERROR] cloudflared 未安装，请先安装 cloudflared"
    exit 1
fi

# 启动 Cloudflare Tunnel
echo "[cloudflared] Starting tunnel..."
cloudflared tunnel --no-autoupdate run --token $TUNNEL_TOKEN &
CLOUDFLARED_PID=$!

echo "[INFO] Starting ArgoSB Script (local)..."

# 映射环境变量为脚本参数，然后执行本地脚本
vlpt="$PORT" uuid="$UUID" argo="n" bash /app/argosb.sh

echo $TUNNEL_DOMAIN

# 等待 cloudflared 进程
wait $CLOUDFLARED_PID

tail -f /dev/null
