@echo off
echo ==========================================
echo   CC Connect 控制面板
echo ==========================================
echo.
echo   [1] 启动服务 (Start Service)
echo   [2] 停止服务 (Stop Service)
echo   [3] 打开浏览器 (Open Browser)
echo   [4] 启动+打开浏览器 (Start + Open Browser)
echo   [5] 退出 (Exit)
echo.
echo ==========================================
echo.
echo 正在启动控制面板...
echo Starting control panel...
echo.
powershell -ExecutionPolicy Bypass -File "%~dp0cc-connect-control.ps1"
