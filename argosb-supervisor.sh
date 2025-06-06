#!/bin/bash

echo "[INFO] Starting ArgoSB Script (local)..."

# 映射环境变量为脚本参数，然后执行本地脚本
vmpt="$PORT" uuid="$UUID" argo="y" agn="$TUNNEL_DOMAIN" agk="$TUNNEL_TOKEN" bash /app/argosb.sh

tail -f /dev/null
