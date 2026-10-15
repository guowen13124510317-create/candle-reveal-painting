#!/bin/bash
# 烛光·古画 新媒体艺术装置 — Mac / Linux 一键启动
cd "$(dirname "$0")"
echo "============================================"
echo "  烛光 · 古画  新媒体艺术装置"
echo "  正在启动本地服务器，稍后自动打开浏览器"
echo "============================================"

open_browser() {
  sleep 2
  if command -v open >/dev/null 2>&1; then open "http://localhost:8000/";
  elif command -v xdg-open >/dev/null 2>&1; then xdg-open "http://localhost:8000/";
  fi
}

if command -v python3 >/dev/null 2>&1; then
  open_browser &
  exec python3 -m http.server 8000 --directory "$PWD"
elif command -v node >/dev/null 2>&1; then
  open_browser &
  exec npx --yes http-server "$PWD" -p 8000
else
  echo "[错误] 没有找到 Python3 或 Node。"
  echo "请先安装 Python3：https://www.python.org/downloads/"
  echo "（Mac 也可执行：brew install python3）"
  exit 1
fi
