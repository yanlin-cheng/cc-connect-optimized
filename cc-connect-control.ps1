# CC Connect Control Panel / CC Connect 控制面板
$Host.UI.RawUI.WindowTitle = "CC Connect Control Panel / CC Connect 控制面板"

# Get script directory / 获取脚本目录
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

function Test-CCConnectInstalled {
    # Check local installation / 检查本地安装
    $localPath = Join-Path $ScriptDir "node_modules\.bin\cc-connect.cmd"
    if (Test-Path $localPath) {
        return $true
    }
    return $false
}

function Get-CCConnectPath {
    # Return local installation path / 返回本地安装路径
    $localPath = Join-Path $ScriptDir "node_modules\.bin\cc-connect.cmd"
    if (Test-Path $localPath) {
        return $localPath
    }
    return $null
}

function Install-CCConnect {
    Write-Host ""
    Write-Host "[INSTALL] CC Connect is not installed." -ForegroundColor Yellow
    Write-Host "[安装] CC Connect 未安装。" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "[INSTALL] Installing CC Connect to script directory..." -ForegroundColor Yellow
    Write-Host "[安装] 正在安装 CC Connect 到脚本目录..." -ForegroundColor Yellow
    Write-Host "[INSTALL] Location / 安装位置: $ScriptDir" -ForegroundColor Cyan
    Write-Host ""

    # Check if npm is installed / 检查 npm 是否安装
    try {
        $npmVersion = npm --version
        Write-Host "[INFO] npm version / npm 版本: $npmVersion" -ForegroundColor Cyan
    } catch {
        Write-Host "[ERROR] npm is not installed." -ForegroundColor Red
        Write-Host "[错误] npm 未安装。" -ForegroundColor Red
        Write-Host "[ERROR] Please install Node.js first." -ForegroundColor Red
        Write-Host "[错误] 请先安装 Node.js。" -ForegroundColor Red
        Write-Host "[ERROR] Download / 下载: https://nodejs.org/" -ForegroundColor Red
        Read-Host "Press Enter to exit / 按回车退出"
        exit 1
    }

    # Install cc-connect locally / 本地安装 cc-connect
    Write-Host "[INSTALL] Running / 运行: npm install cc-connect" -ForegroundColor Cyan
    Push-Location $ScriptDir
    npm install cc-connect
    Pop-Location

    if ($LASTEXITCODE -eq 0) {
        Write-Host "[DONE] CC Connect installed successfully!" -ForegroundColor Green
        Write-Host "[完成] CC Connect 安装成功！" -ForegroundColor Green
        Write-Host "[DONE] Installed to / 安装到: $ScriptDir\node_modules\.bin\cc-connect.cmd" -ForegroundColor Green
    } else {
        Write-Host "[ERROR] Failed to install CC Connect." -ForegroundColor Red
        Write-Host "[错误] CC Connect 安装失败。" -ForegroundColor Red
        Read-Host "Press Enter to exit / 按回车退出"
        exit 1
    }

    Write-Host ""
}

function Show-Menu {
    Clear-Host
    Write-Host ""
    Write-Host "  ==========================================" -ForegroundColor Cyan
    Write-Host "    CC Connect Control Panel" -ForegroundColor Cyan
    Write-Host "    CC Connect 控制面板" -ForegroundColor Cyan
    Write-Host "  ==========================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "   [1] Start Service / 启动服务" -ForegroundColor Green
    Write-Host "   [2] Stop Service / 停止服务" -ForegroundColor Red
    Write-Host "   [3] Open Browser / 打开浏览器" -ForegroundColor Yellow
    Write-Host "   [4] Start + Open Browser / 启动+打开浏览器" -ForegroundColor Magenta
    Write-Host "   [5] Exit / 退出" -ForegroundColor Gray
    Write-Host ""
    Write-Host "  ==========================================" -ForegroundColor Cyan
    Write-Host ""

    # Show installation status / 显示安装状态
    if (Test-CCConnectInstalled) {
        $ccConnectPath = Get-CCConnectPath
        Write-Host "  Status / 状态: CC Connect installed / 已安装" -ForegroundColor Green
        Write-Host "  Location / 位置: $ccConnectPath" -ForegroundColor Gray
    } else {
        Write-Host "  Status / 状态: CC Connect not installed / 未安装" -ForegroundColor Yellow
        Write-Host "  Will install on first use / 首次使用时自动安装" -ForegroundColor Gray
    }
    Write-Host ""
}

function Start-Service {
    Write-Host ""
    Write-Host "[START] Starting CC Connect service..." -ForegroundColor Green
    Write-Host "[启动] 正在启动 CC Connect 服务..." -ForegroundColor Green

    # Check if cc-connect is installed / 检查是否已安装
    if (-not (Test-CCConnectInstalled)) {
        Install-CCConnect
    }

    $ccConnectPath = Get-CCConnectPath
    Start-Process -FilePath $ccConnectPath -WindowStyle Hidden
    Write-Host "[DONE] Service started!" -ForegroundColor Green
    Write-Host "[完成] 服务已启动！" -ForegroundColor Green
    Write-Host ""
    Write-Host "Web UI: http://localhost:9820" -ForegroundColor White
    Write-Host "API Token: (See config.toml / 见 config.toml)" -ForegroundColor White
    Write-Host ""
    Read-Host "Press Enter to continue / 按回车继续"
}

function Stop-Service {
    Write-Host ""
    Write-Host "[STOP] Stopping CC Connect service..." -ForegroundColor Red
    Write-Host "[停止] 正在停止 CC Connect 服务..." -ForegroundColor Red
    Stop-Process -Name "cc-connect" -Force -ErrorAction SilentlyContinue
    Write-Host "[DONE] Service stopped!" -ForegroundColor Green
    Write-Host "[完成] 服务已停止！" -ForegroundColor Green
    Write-Host ""
    Read-Host "Press Enter to continue / 按回车继续"
}

function Open-Browser {
    Write-Host ""
    Write-Host "[BROWSER] Opening Web UI..." -ForegroundColor Yellow
    Write-Host "[浏览器] 正在打开 Web UI..." -ForegroundColor Yellow
    Start-Process "http://localhost:9820"
    Write-Host "[DONE] Browser opened!" -ForegroundColor Green
    Write-Host "[完成] 浏览器已打开！" -ForegroundColor Green
    Write-Host ""
    Read-Host "Press Enter to continue / 按回车继续"
}

function Start-AndOpen {
    Write-Host ""
    Write-Host "[START] Starting CC Connect service..." -ForegroundColor Green
    Write-Host "[启动] 正在启动 CC Connect 服务..." -ForegroundColor Green

    # Check if cc-connect is installed / 检查是否已安装
    if (-not (Test-CCConnectInstalled)) {
        Install-CCConnect
    }

    $ccConnectPath = Get-CCConnectPath
    Start-Process -FilePath $ccConnectPath -WindowStyle Hidden
    Write-Host "[WAIT] Waiting for service..." -ForegroundColor Yellow
    Write-Host "[等待] 等待服务启动..." -ForegroundColor Yellow
    Start-Sleep -Seconds 5
    Write-Host "[BROWSER] Opening Web UI..." -ForegroundColor Yellow
    Write-Host "[浏览器] 正在打开 Web UI..." -ForegroundColor Yellow
    Start-Process "http://localhost:9820"
    Write-Host "[DONE] Service started, browser opened!" -ForegroundColor Green
    Write-Host "[完成] 服务已启动，浏览器已打开！" -ForegroundColor Green
    Write-Host ""
    Write-Host "Web UI: http://localhost:9820" -ForegroundColor White
    Write-Host "API Token: (See config.toml / 见 config.toml)" -ForegroundColor White
    Write-Host ""
    Read-Host "Press Enter to continue / 按回车继续"
}

# Main loop / 主循环
do {
    Show-Menu
    $choice = Read-Host "Select option (1-5) / 请选择操作 (1-5)"

    switch ($choice) {
        "1" { Start-Service }
        "2" { Stop-Service }
        "3" { Open-Browser }
        "4" { Start-AndOpen }
        "5" {
            Write-Host ""
            Write-Host "Goodbye! / 再见！" -ForegroundColor Cyan
            Start-Sleep -Seconds 1
            exit
        }
        default {
            Write-Host ""
            Write-Host "Invalid choice, try again! / 无效选择，请重试！" -ForegroundColor Red
            Start-Sleep -Seconds 2
        }
    }
} while ($true)
