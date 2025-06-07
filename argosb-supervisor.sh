#!/bin/bash


echo "[INFO] Starting ArgoSB Script (local)..."

# 映射环境变量为脚本参数，然后执行本地脚本
vlpt="$PORT" uuid="$UUID" bash /app/argosb.sh


# 启动 Cloudflare Tunnel
echo "[cloudflared] Starting tunnel..."
echo $TUNNEL_TOKEN
exec cloudflared tunnel --no-autoupdate run --token $TUNNEL_TOKEN
