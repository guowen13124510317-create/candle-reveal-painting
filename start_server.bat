@echo off
chcp 65001 >nul
title 烛光·古画 装置服务器
cd /d "%~dp0"
echo ============================================
echo   烛光 · 古画  新媒体艺术装置
echo   正在启动本地服务器，稍后自动打开浏览器
echo ============================================
echo.

where python >nul 2>nul
if %errorlevel%==0 (
  start "server" cmd /k "python -m http.server 8000 --directory %CD%"
  goto :open
)
where py >nul 2>nul
if %errorlevel%==0 (
  start "server" cmd /k "py -m http.server 8000 --directory %CD%"
  goto :open
)
where node >nul 2>nul
if %errorlevel%==0 (
  start "server" cmd /k "npx --yes http-server %CD% -p 8000"
  goto :open
)
echo [错误] 电脑上没有找到 Python 或 Node。
echo 请先安装 Python（https://www.python.org/downloads/），
echo 安装时务必勾选 “Add Python to PATH”，装好后重新双击本文件。
pause
exit /b

:open
timeout /t 2 >nul
start "" "http://localhost:8000/"
echo 已在浏览器打开。若页面未加载，请手动访问 http://localhost:8000/
echo 关闭这个黑色窗口就会停止服务器。
pause >nul
