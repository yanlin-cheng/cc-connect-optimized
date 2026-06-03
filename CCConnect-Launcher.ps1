# CC Connect Control Panel
# Right-click this file -> "Run with PowerShell" to start
# If blocked, run in PowerShell: Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $scriptDir

$npmGlobalDir = "$env:APPDATA\npm"

function Get-AgentStatus {
    $agents = @(
        @{ Name = "claude"; Desc = "Claude Code" },
        @{ Name = "codex"; Desc = "OpenAI Codex" },
        @{ Name = "cursor"; Desc = "Cursor" },
        @{ Name = "gemini"; Desc = "Gemini CLI" }
    )
    $found = @()
    foreach ($agent in $agents) {
        $cmd = Get-Command $agent.Name -ErrorAction SilentlyContinue
        if ($cmd) { $found += $agent.Desc }
    }
    return $found
}

function Get-CCConnectStatus {
    # Check global install first (recommended)
    $globalCmd = Join-Path $npmGlobalDir "cc-connect.cmd"
    if (Test-Path $globalCmd) { return "global" }

    # Check local install
    $localCmd = Join-Path $scriptDir "node_modules\.bin\cc-connect.cmd"
    if (Test-Path $localCmd) { return "local" }

    # Check PATH
    $inPath = Get-Command cc-connect -ErrorAction SilentlyContinue
    if ($inPath) { return "path" }

    return "not_found"
}

function Show-Status {
    $status = Get-CCConnectStatus
    switch ($status) {
        "global"    { Write-Host "  Status: Installed (global) / 已安装 (全局)" -ForegroundColor Green }
        "local"     { Write-Host "  Status: Installed (local) / 已安装 (本地)" -ForegroundColor Yellow }
        "path"      { Write-Host "  Status: Installed (in PATH) / 已安装 (PATH 中)" -ForegroundColor Green }
        "not_found" { Write-Host "  Status: NOT INSTALLED / 未安装" -ForegroundColor Yellow }
    }
    return $status
}

function Install-CCConnect {
    Write-Host ""
    Write-Host "  Select install method / 选择安装方式:" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "  [1] Global install (Recommended) / 全局安装 (推荐)" -ForegroundColor Green
    Write-Host "      Install to: $npmGlobalDir" -ForegroundColor Gray
    Write-Host "      Works everywhere, stable and reliable" -ForegroundColor Gray
    Write-Host ""
    Write-Host "  [2] Local install / 本地安装" -ForegroundColor White
    Write-Host "      Install to: $scriptDir\node_modules" -ForegroundColor Gray
    Write-Host "      Only works in this folder" -ForegroundColor Gray
    Write-Host ""
    $method = Read-Host "  Choose (1-2, default 1)"

    $npm = Get-Command npm -ErrorAction SilentlyContinue
    if (-not $npm) {
        Write-Host ""
        Write-Host "  [ERROR] npm not found. Please install Node.js first." -ForegroundColor Red
        Write-Host "  https://nodejs.org/" -ForegroundColor Yellow
        Write-Host ""
        Read-Host "  Press Enter / 按回车继续"
        return $false
    }

    Write-Host ""

    if ($method -eq "2") {
        # Local install
        Write-Host "  Installing locally..." -ForegroundColor Cyan
        Write-Host "  Directory: $scriptDir" -ForegroundColor Gray
        Write-Host ""
        & npm install cc-connect 2>&1 | ForEach-Object { Write-Host "  $_" -ForegroundColor Gray }
    } else {
        # Global install (default)
        Write-Host "  Installing globally..." -ForegroundColor Cyan
        Write-Host "  Directory: $npmGlobalDir" -ForegroundColor Gray
        Write-Host ""
        & npm install -g cc-connect 2>&1 | ForEach-Object { Write-Host "  $_" -ForegroundColor Gray }
    }

    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "  [OK] CC Connect installed! / 安装成功!" -ForegroundColor Green
        return $true
    } else {
        Write-Host ""
        Write-Host "  [ERROR] Install failed / 安装失败" -ForegroundColor Red
        Write-Host ""
        Read-Host "  Press Enter / 按回车继续"
        return $false
    }
}

function New-DesktopShortcut {
    $desktopPath = [Environment]::GetFolderPath("Desktop")
    $shortcutPath = Join-Path $desktopPath "CC Connect.lnk"
    $ps1Path = $MyInvocation.ScriptName
    if (-not $ps1Path) { $ps1Path = $PSCommandPath }

    $shell = New-Object -ComObject WScript.Shell
    $shortcut = $shell.CreateShortcut($shortcutPath)
    $shortcut.TargetPath = "powershell.exe"
    $shortcut.Arguments = "-ExecutionPolicy Bypass -File `"$ps1Path`""
    $shortcut.WorkingDirectory = $scriptDir
    $shortcut.IconLocation = "powershell.exe,0"
    $shortcut.Description = "CC Connect Control Panel"
    $shortcut.Save()

    Write-Host ""
    Write-Host "  [OK] Desktop shortcut created! / 桌面快捷方式已创建!" -ForegroundColor Green
    Write-Host "  Location: $shortcutPath" -ForegroundColor Gray
}

function Start-Service {
    $status = Get-CCConnectStatus
    if ($status -eq "not_found") {
        Write-Host ""
        Write-Host "  CC Connect not installed / 未安装" -ForegroundColor Yellow
        $install = Read-Host "  Install now? / 现在安装? (Y/N)"
        if ($install -eq "Y" -or $install -eq "y") {
            if (-not (Install-CCConnect)) { return }
        } else {
            return
        }
    }

    # Check for AI agent CLI
    $agents = Get-AgentStatus
    if ($agents.Count -eq 0) {
        Write-Host ""
        Write-Host "  [ERROR] No AI Agent CLI found / 未检测到 AI 代理" -ForegroundColor Red
        Write-Host ""
        Write-Host "  CC Connect requires at least one AI agent to run." -ForegroundColor Yellow
        Write-Host "  CC Connect 需要至少一个 AI 代理才能运行。" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "  Please install one of the following:" -ForegroundColor White
        Write-Host "  请安装以下任意一个:" -ForegroundColor White
        Write-Host ""
        Write-Host "  - Claude Code  : https://docs.anthropic.com/en/docs/claude-code" -ForegroundColor Cyan
        Write-Host "  - OpenAI Codex : https://github.com/openai/codex" -ForegroundColor Cyan
        Write-Host "  - Cursor       : https://cursor.sh" -ForegroundColor Cyan
        Write-Host "  - Gemini CLI   : https://github.com/google-gemini/gemini-cli" -ForegroundColor Cyan
        Write-Host ""
        Read-Host "  Press Enter / 按回车返回"
        return
    } else {
        Write-Host ""
        Write-Host "  AI Agent found / 检测到代理: $($agents -join ', ')" -ForegroundColor Green
    }

    Write-Host ""
    Write-Host "  Starting CC Connect..." -ForegroundColor Cyan

    # Add npm global dir to PATH
    if ($env:PATH -notlike "*$npmGlobalDir*") {
        $env:PATH = "$npmGlobalDir;$env:PATH"
    }

    # Find cc-connect.cmd - prefer global, then local
    $globalCmd = Join-Path $npmGlobalDir "cc-connect.cmd"
    $localCmd = Join-Path $scriptDir "node_modules\.bin\cc-connect.cmd"

    if (Test-Path $globalCmd) {
        $ccCmd = $globalCmd
        Write-Host "  Using global: $globalCmd" -ForegroundColor Gray
    } elseif (Test-Path $localCmd) {
        $ccCmd = $localCmd
        Write-Host "  Using local: $localCmd" -ForegroundColor Gray
    } else {
        $ccCmd = "cc-connect.cmd"
        Write-Host "  Using PATH: cc-connect.cmd" -ForegroundColor Gray
    }

    $configPath = Join-Path $scriptDir "config.toml"
    if (Test-Path $configPath) {
        $env:CC_CONFIG_FILE = $configPath
        Write-Host "  Using config: $configPath" -ForegroundColor Gray
    } else {
        Write-Host "  Config not found, using default config" -ForegroundColor Yellow
        Write-Host "  (You can configure platforms in the Web UI)" -ForegroundColor Gray
    }

    $env:CC_CONNECT_PORT = "9820"

    Start-Process -FilePath $ccCmd -WindowStyle Normal
    Write-Host ""
    Write-Host "  [OK] CC Connect started! / 启动成功!" -ForegroundColor Green
    Write-Host "  Web UI: http://localhost:9820" -ForegroundColor Cyan
    Write-Host "  Opening browser in 3 seconds / 3秒后打开浏览器..." -ForegroundColor Gray
    Start-Sleep -Seconds 3
    Start-Process "http://localhost:9820"
}

function Stop-Service {
    Write-Host ""
    Write-Host "  Stopping CC Connect..." -ForegroundColor Cyan
    $processes = Get-Process -Name "cc-connect" -ErrorAction SilentlyContinue
    if ($processes) {
        $processes | Stop-Process -Force
        Write-Host "  [OK] Stopped. / 已停止" -ForegroundColor Green
    } else {
        Write-Host "  Not running. / 未运行" -ForegroundColor Yellow
    }
}

function Open-Browser {
    Write-Host ""
    Write-Host "  Opening browser..." -ForegroundColor Cyan
    Start-Process "http://localhost:9820"
    Write-Host "  [OK] http://localhost:9820" -ForegroundColor Green
}

# Check if first run - offer to create shortcut
$desktopPath = [Environment]::GetFolderPath("Desktop")
$shortcutPath = Join-Path $desktopPath "CC Connect.lnk"
$firstRun = -not (Test-Path $shortcutPath)

# Main menu loop
while ($true) {
    Clear-Host
    Write-Host ""
    Write-Host "  =================================================" -ForegroundColor Cyan
    Write-Host "     CC Connect Control Panel" -ForegroundColor White
    Write-Host "     CC Connect 控制面板" -ForegroundColor Gray
    Write-Host "  =================================================" -ForegroundColor Cyan
    Write-Host ""

    $status = Show-Status

    Write-Host ""
    Write-Host "  [1] Start Service / 开始服务" -ForegroundColor White
    Write-Host "  [2] Stop Service / 停止服务" -ForegroundColor White
    Write-Host "  [3] Open Browser / 打开浏览器" -ForegroundColor White
    Write-Host "  [4] Start and Open Browser / 启动并打开浏览器" -ForegroundColor Green
    Write-Host "  [5] Create Desktop Shortcut / 创建桌面快捷方式" -ForegroundColor White
    Write-Host "  [6] Exit / 退出" -ForegroundColor White
    Write-Host ""

    # First run guidance
    if ($firstRun) {
        Write-Host "  [TIP] First time? Press 5 to create a desktop shortcut" -ForegroundColor Yellow
        Write-Host "  [提示] 首次使用？按 5 创建桌面快捷方式" -ForegroundColor Yellow
        Write-Host ""
    }

    $choice = Read-Host "  Enter your choice / 请输入选项 (1-6)"

    switch ($choice) {
        "1" { Start-Service; Write-Host ""; Read-Host "  Press Enter / 按回车继续" }
        "2" { Stop-Service; Write-Host ""; Read-Host "  Press Enter / 按回车继续" }
        "3" { Open-Browser; Write-Host ""; Read-Host "  Press Enter / 按回车继续" }
        "4" { Start-Service; Write-Host ""; Read-Host "  Press Enter / 按回车继续" }
        "5" {
            New-DesktopShortcut
            $firstRun = $false
            Write-Host ""
            Read-Host "  Press Enter / 按回车继续"
        }
        "6" {
            Write-Host ""
            Write-Host "  Goodbye! / 再见!" -ForegroundColor Cyan
            Write-Host ""
            exit
        }
        default {
            Write-Host ""
            Write-Host "  Invalid choice / 无效选项，请输入 1-6" -ForegroundColor Red
            Start-Sleep -Seconds 1
        }
    }
}
