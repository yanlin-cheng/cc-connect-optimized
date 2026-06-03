@echo off
chcp 65001 >nul
echo ==========================================
echo   CC Connect Control Panel
echo   CC Connect 控制面板
echo ==========================================
echo.
echo   Starting...
echo   正在启动...
echo.
powershell -ExecutionPolicy Bypass -File "%~dp0cc-connect-control.ps1"
