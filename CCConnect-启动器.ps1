# CC Connect 启动器
# CC Connect Launcher
# 右键点击 → 使用 PowerShell 运行
# Right-click → Run with PowerShell

$Host.UI.RawUI.WindowTitle = "CC Connect 启动器 / CC Connect Launcher"

# 获取脚本目录
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# 桌面路径
$DesktopPath = [Environment]::GetFolderPath("Desktop")
$ShortcutPath = Join-Path $DesktopPath "CCConnect 启动器.bat"

function Show-Header {
    Clear-Host
    Write-Host ""
    Write-Host "  ==========================================" -ForegroundColor Cyan
    Write-Host "    CC Connect 启动器" -ForegroundColor Cyan
    Write-Host "    CC Connect Launcher" -ForegroundColor Cyan
    Write-Host "  ==========================================" -ForegroundColor Cyan
    Write-Host ""
}

function Test-CCConnectInstalled {
    $localPath = Join-Path $ScriptDir "node_modules\.bin\cc-connect.cmd"
    return (Test-Path $localPath)
}

function Install-CCConnect {
    Write-Host "  [安装] CC Connect 未安装，正在安装..." -ForegroundColor Yellow
    Write-Host "  [Install] CC Connect not installed, installing..." -ForegroundColor Yellow
    Write-Host ""

    # 检查 npm
    try {
        $npmVersion = npm --version
        Write-Host "  [信息] npm 版本: $npmVersion" -ForegroundColor Cyan
    } catch {
        Write-Host "  [错误] npm 未安装，请先安装 Node.js" -ForegroundColor Red
        Write-Host "  [Error] npm not installed, please install Node.js first" -ForegroundColor Red
        Write-Host "  [下载] https://nodejs.org/" -ForegroundColor Red
        Read-Host "  按回车退出 / Press Enter to exit"
        exit 1
    }

    # 安装 cc-connect
    Write-Host "  [安装] 正在运行: npm install cc-connect" -ForegroundColor Cyan
    Push-Location $ScriptDir
    npm install cc-connect
    Pop-Location

    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "  [完成] CC Connect 安装成功！" -ForegroundColor Green
        Write-Host "  [Done] CC Connect installed successfully!" -ForegroundColor Green
    } else {
        Write-Host ""
        Write-Host "  [错误] 安装失败" -ForegroundColor Red
        Write-Host "  [Error] Installation failed" -ForegroundColor Red
        Read-Host "  按回车退出 / Press Enter to exit"
        exit 1
    }
}

function Create-DesktopShortcut {
    Write-Host ""
    Write-Host "  [快捷方式] 正在创建桌面快捷方式..." -ForegroundColor Yellow
    Write-Host "  [Shortcut] Creating desktop shortcut..." -ForegroundColor Yellow

    # 创建 bat 启动器内容
    $batContent = @"
@echo off
chcp 65001 >nul
echo ==========================================
echo   CC Connect Control Panel
echo   CC Connect 控制面板
echo ==========================================
echo.
powershell -ExecutionPolicy Bypass -File "$ScriptDir\cc-connect-control.ps1"
"@

    # 写入桌面快捷方式
    Set-Content -Path $ShortcutPath -Value $batContent -Encoding UTF8

    Write-Host "  [完成] 桌面快捷方式已创建" -ForegroundColor Green
    Write-Host "  [Done] Desktop shortcut created" -ForegroundColor Green
    Write-Host "  [位置] $ShortcutPath" -ForegroundColor Gray
}

function Show-Menu {
    Show-Header

    # 检查安装状态
    if (Test-CCConnectInstalled) {
        Write-Host "  [状态] CC Connect 已安装" -ForegroundColor Green
        Write-Host "  [Status] CC Connect installed" -ForegroundColor Green
    } else {
        Write-Host "  [状态] CC Connect 未安装" -ForegroundColor Yellow
        Write-Host "  [Status] CC Connect not installed" -ForegroundColor Yellow
    }

    # 检查桌面快捷方式
    if (Test-Path $ShortcutPath) {
        Write-Host "  [快捷方式] 桌面快捷方式已存在" -ForegroundColor Green
        Write-Host "  [Shortcut] Desktop shortcut exists" -ForegroundColor Green
    } else {
        Write-Host "  [快捷方式] 桌面快捷方式未创建" -ForegroundColor Yellow
        Write-Host "  [Shortcut] Desktop shortcut not created" -ForegroundColor Yellow
    }

    Write-Host ""
    Write-Host "  ==========================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "   [1] 启动服务 / Start Service" -ForegroundColor Green
    Write-Host "   [2] 停止服务 / Stop Service" -ForegroundColor Red
    Write-Host "   [3] 打开浏览器 / Open Browser" -ForegroundColor Yellow
    Write-Host "   [4] 启动+打开浏览器 / Start + Open Browser" -ForegroundColor Magenta
    Write-Host "   [5] 创建桌面快捷方式 / Create Desktop Shortcut" -ForegroundColor Cyan
    Write-Host "   [6] 退出 / Exit" -ForegroundColor Gray
    Write-Host ""
    Write-Host "  ==========================================" -ForegroundColor Cyan
    Write-Host ""
}

function Start-Service {
    Write-Host ""
    Write-Host "  [启动] 正在启动 CC Connect 服务..." -ForegroundColor Green
    Write-Host "  [Start] Starting CC Connect service..." -ForegroundColor Green

    if (-not (Test-CCConnectInstalled)) {
        Install-CCConnect
    }

    $ccConnectPath = Join-Path $ScriptDir "node_modules\.bin\cc-connect.cmd"
    Start-Process -FilePath $ccConnectPath -WindowStyle Hidden
    Write-Host "  [完成] 服务已启动！" -ForegroundColor Green
    Write-Host "  [Done] Service started!" -ForegroundColor Green
    Write-Host ""
    Write-Host "  Web UI: http://localhost:9820" -ForegroundColor White
    Write-Host ""
    Read-Host "  按回车继续 / Press Enter to continue"
}

function Stop-Service {
    Write-Host ""
    Write-Host "  [停止] 正在停止 CC Connect 服务..." -ForegroundColor Red
    Write-Host "  [Stop] Stopping CC Connect service..." -ForegroundColor Red
    Stop-Process -Name "cc-connect" -Force -ErrorAction SilentlyContinue
    Write-Host "  [完成] 服务已停止！" -ForegroundColor Green
    Write-Host "  [Done] Service stopped!" -ForegroundColor Green
    Write-Host ""
    Read-Host "  按回车继续 / Press Enter to continue"
}

function Open-Browser {
    Write-Host ""
    Write-Host "  [浏览器] 正在打开 Web UI..." -ForegroundColor Yellow
    Write-Host "  [Browser] Opening Web UI..." -ForegroundColor Yellow
    Start-Process "http://localhost:9820"
    Write-Host "  [完成] 浏览器已打开！" -ForegroundColor Green
    Write-Host "  [Done] Browser opened!" -ForegroundColor Green
    Write-Host ""
    Read-Host "  按回车继续 / Press Enter to continue"
}

function Start-AndOpen {
    Write-Host ""
    Write-Host "  [启动] 正在启动 CC Connect 服务..." -ForegroundColor Green
    Write-Host "  [Start] Starting CC Connect service..." -ForegroundColor Green

    if (-not (Test-CCConnectInstalled)) {
        Install-CCConnect
    }

    $ccConnectPath = Join-Path $ScriptDir "node_modules\.bin\cc-connect.cmd"
    Start-Process -FilePath $ccConnectPath -WindowStyle Hidden
    Write-Host "  [等待] 等待服务启动..." -ForegroundColor Yellow
    Write-Host "  [Wait] Waiting for service..." -ForegroundColor Yellow
    Start-Sleep -Seconds 5
    Write-Host "  [浏览器] 正在打开 Web UI..." -ForegroundColor Yellow
    Write-Host "  [Browser] Opening Web UI..." -ForegroundColor Yellow
    Start-Process "http://localhost:9820"
    Write-Host "  [完成] 服务已启动，浏览器已打开！" -ForegroundColor Green
    Write-Host "  [Done] Service started, browser opened!" -ForegroundColor Green
    Write-Host ""
    Write-Host "  Web UI: http://localhost:9820" -ForegroundColor White
    Write-Host ""
    Read-Host "  按回车继续 / Press Enter to continue"
}

# 主循环
do {
    Show-Menu
    $choice = Read-Host "  请选择 (1-6) / Select option (1-6)"

    switch ($choice) {
        "1" { Start-Service }
        "2" { Stop-Service }
        "3" { Open-Browser }
        "4" { Start-AndOpen }
        "5" { Create-DesktopShortcut }
        "6" {
            Write-Host ""
            Write-Host "  再见！/ Goodbye!" -ForegroundColor Cyan
            Start-Sleep -Seconds 1
            exit
        }
        default {
            Write-Host ""
            Write-Host "  无效选择，请重试 / Invalid choice, try again!" -ForegroundColor Red
            Start-Sleep -Seconds 2
        }
    }
} while ($true)
