@echo off
chcp 65001 >nul
echo ==========================================
echo   CC Connect 启动器
echo   CC Connect Launcher
echo ==========================================
echo.
echo   正在启动...
echo   Starting...
echo.

:: 检查是否安装了 Node.js
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo   [错误] 未安装 Node.js
    echo   [Error] Node.js not installed
    echo.
    echo   请先安装 Node.js：https://nodejs.org/
    echo   Please install Node.js first: https://nodejs.org/
    echo.
    pause
    exit /b 1
)

:: 检查是否安装了 npm
where npm >nul 2>nul
if %errorlevel% neq 0 (
    echo   [错误] 未安装 npm
    echo   [Error] npm not installed
    echo.
    echo   请先安装 Node.js：https://nodejs.org/
    echo   Please install Node.js first: https://nodejs.org/
    echo.
    pause
    exit /b 1
)

:: 检查是否安装了 CC Connect
if exist "%~dp0node_modules\.bin\cc-connect.cmd" (
    echo   [状态] CC Connect 已安装
    echo   [Status] CC Connect installed
) else (
    echo   [安装] CC Connect 未安装，正在安装...
    echo   [Install] CC Connect not installed, installing...
    echo.
    cd /d "%~dp0"
    npm install cc-connect
    if %errorlevel% neq 0 (
        echo.
        echo   [错误] 安装失败
        echo   [Error] Installation failed
        pause
        exit /b 1
    )
    echo.
    echo   [完成] CC Connect 安装成功！
    echo   [Done] CC Connect installed successfully!
)

:: 创建桌面快捷方式
echo.
echo   [快捷方式] 正在创建桌面快捷方式...
echo   [Shortcut] Creating desktop shortcut...

set "desktopPath=%USERPROFILE%\Desktop"
set "shortcutPath=%desktopPath%\CCConnect 启动器.bat"

(
    echo @echo off
    echo chcp 65001 ^>nul
    echo echo ==========================================
    echo echo   CC Connect 启动器
    echo echo   CC Connect Launcher
    echo echo ==========================================
    echo echo.
    echo cd /d "%~dp0"
    echo powershell -ExecutionPolicy Bypass -File "%~dp0CCConnect-Launcher.ps1"
    echo pause
) > "%shortcutPath%"

echo   [完成] 桌面快捷方式已创建
echo   [Done] Desktop shortcut created
echo   [位置] %shortcutPath%
echo.

:: 启动 PowerShell 脚本
echo   [启动] 正在启动控制面板...
echo   [Start] Starting control panel...
echo.
powershell -ExecutionPolicy Bypass -File "%~dp0CCConnect-Launcher.ps1"
