# CC Connect 控制面板
# CC Connect Control Panel

$Host.UI.RawUI.WindowTitle = "CC Connect 启动器 / CC Connect Launcher"

# 获取脚本目录
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

function Test-CCConnectInstalled {
    # 检查本地安装
    $localPath = Join-Path $ScriptDir "node_modules\.bin\cc-connect.cmd"
    if (Test-Path $localPath) {
        return $true
    }

    # 检查全局安装
    $globalPath = Get-Command cc-connect -ErrorAction SilentlyContinue
    if ($globalPath) {
        return $true
    }

    return $false
}

function Get-CCConnectPath {
    # 检查本地安装
    $localPath = Join-Path $ScriptDir "node_modules\.bin\cc-connect.cmd"
    if (Test-Path $localPath) {
        return $localPath
    }

    # 检查全局安装
    $globalPath = Get-Command cc-connect -ErrorAction SilentlyContinue
    if ($globalPath) {
        return $globalPath.Source
    }

    return $null
}

function Start-Service {
    Write-Host ""
    Write-Host "  [启动] 正在启动 CC Connect 服务..." -ForegroundColor Green
    Write-Host "  [Start] Starting CC Connect service..." -ForegroundColor Green

    if (-not (Test-CCConnectInstalled)) {
        Write-Host "  [错误] CC Connect 未安装" -ForegroundColor Red
        Write-Host "  [Error] CC Connect not installed" -ForegroundColor Red
        Read-Host "  按回车继续"
        return
    }

    $ccConnectPath = Get-CCConnectPath
    Start-Process -FilePath $ccConnectPath -WindowStyle Hidden
    Write-Host "  [完成] 服务已启动！" -ForegroundColor Green
    Write-Host "  [Done] Service started!" -ForegroundColor Green
    Write-Host ""
    Write-Host "  Web UI: http://localhost:9820" -ForegroundColor White
    Write-Host ""
    Read-Host "  按回车继续"
}

function Stop-Service {
    Write-Host ""
    Write-Host "  [停止] 正在停止 CC Connect 服务..." -ForegroundColor Red
    Write-Host "  [Stop] Stopping CC Connect service..." -ForegroundColor Red
    Stop-Process -Name "cc-connect" -Force -ErrorAction SilentlyContinue
    Write-Host "  [完成] 服务已停止！" -ForegroundColor Green
    Write-Host "  [Done] Service stopped!" -ForegroundColor Green
    Write-Host ""
    Read-Host "  按回车继续"
}

function Open-Browser {
    Write-Host ""
    Write-Host "  [浏览器] 正在打开 Web UI..." -ForegroundColor Yellow
    Write-Host "  [Browser] Opening Web UI..." -ForegroundColor Yellow
    Start-Process "http://localhost:9820"
    Write-Host "  [完成] 浏览器已打开！" -ForegroundColor Green
    Write-Host "  [Done] Browser opened!" -ForegroundColor Green
    Write-Host ""
    Read-Host "  按回车继续"
}

function Start-AndOpen {
    Write-Host ""
    Write-Host "  [启动] 正在启动 CC Connect 服务..." -ForegroundColor Green
    Write-Host "  [Start] Starting CC Connect service..." -ForegroundColor Green

    if (-not (Test-CCConnectInstalled)) {
        Write-Host "  [错误] CC Connect 未安装" -ForegroundColor Red
        Write-Host "  [Error] CC Connect not installed" -ForegroundColor Red
        Read-Host "  按回车继续"
        return
    }

    $ccConnectPath = Get-CCConnectPath
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
    Read-Host "  按回车继续"
}

# 主循环
do {
    Clear-Host
    Write-Host ""
    Write-Host "  ==========================================" -ForegroundColor Cyan
    Write-Host "    CC Connect 启动器" -ForegroundColor Cyan
    Write-Host "    CC Connect Launcher" -ForegroundColor Cyan
    Write-Host "  ==========================================" -ForegroundColor Cyan
    Write-Host ""

    # 检查安装状态
    if (Test-CCConnectInstalled) {
        Write-Host "  [状态] CC Connect 已安装" -ForegroundColor Green
        Write-Host "  [Status] CC Connect installed" -ForegroundColor Green
    } else {
        Write-Host "  [状态] CC Connect 未安装" -ForegroundColor Yellow
        Write-Host "  [Status] CC Connect not installed" -ForegroundColor Yellow
    }

    Write-Host ""
    Write-Host "  ==========================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "   [1] 启动服务 / Start Service" -ForegroundColor Green
    Write-Host "   [2] 停止服务 / Stop Service" -ForegroundColor Red
    Write-Host "   [3] 打开浏览器 / Open Browser" -ForegroundColor Yellow
    Write-Host "   [4] 启动+打开浏览器 / Start + Open Browser" -ForegroundColor Magenta
    Write-Host "   [5] 退出 / Exit" -ForegroundColor Gray
    Write-Host ""
    Write-Host "  ==========================================" -ForegroundColor Cyan
    Write-Host ""

    $choice = Read-Host "  请选择 (1-5) / Select option (1-5)"

    switch ($choice) {
        "1" { Start-Service }
        "2" { Stop-Service }
        "3" { Open-Browser }
        "4" { Start-AndOpen }
        "5" {
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
