# CC Connect Control Panel
# Right-click this file -> "Run with PowerShell" to start
# If blocked, run in PowerShell: Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned

chcp 65001 | Out-Null
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $scriptDir

function Get-CCConnectStatus {
    $localCmd = Join-Path $scriptDir "node_modules\.bin\cc-connect.cmd"
    if (Test-Path $localCmd) { return "local" }

    $npmGlobalDir = "$env:APPDATA\npm"
    $globalCmd = Join-Path $npmGlobalDir "cc-connect.cmd"
    if (Test-Path $globalCmd) { return "global" }

    $inPath = Get-Command cc-connect -ErrorAction SilentlyContinue
    if ($inPath) { return "path" }

    return "not_found"
}

function Show-Status {
    $status = Get-CCConnectStatus
    switch ($status) {
        "local"     { Write-Host "  Status: Installed (local) / 宸插畨瑁?(鏈湴)" -ForegroundColor Green }
        "global"    { Write-Host "  Status: Installed (global) / 宸插畨瑁?(鍏ㄥ眬)" -ForegroundColor Green }
        "path"      { Write-Host "  Status: Installed (in PATH) / 宸插畨瑁?(PATH 涓?" -ForegroundColor Green }
        "not_found" { Write-Host "  Status: NOT INSTALLED / 鏈畨瑁? -ForegroundColor Yellow }
    }
    return $status
}

function Install-CCConnect {
    Write-Host ""
    Write-Host "  Installing CC Connect..." -ForegroundColor Cyan
    Write-Host "  Directory: $scriptDir" -ForegroundColor Gray
    Write-Host ""

    $npm = Get-Command npm -ErrorAction SilentlyContinue
    if (-not $npm) {
        Write-Host "  [ERROR] npm not found. Please install Node.js first." -ForegroundColor Red
        Write-Host "  [閿欒] 鏈壘鍒?npm锛岃鍏堝畨瑁?Node.js" -ForegroundColor Red
        Write-Host "  https://nodejs.org/" -ForegroundColor Yellow
        Write-Host ""
        Read-Host "  Press Enter / 鎸夊洖杞︾户缁?
        return $false
    }

    & npm install cc-connect 2>&1 | ForEach-Object { Write-Host "  $_" -ForegroundColor Gray }

    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "  [OK] CC Connect installed! / 瀹夎鎴愬姛!" -ForegroundColor Green
        return $true
    } else {
        Write-Host ""
        Write-Host "  [ERROR] Install failed / 瀹夎澶辫触" -ForegroundColor Red
        Write-Host ""
        Read-Host "  Press Enter / 鎸夊洖杞︾户缁?
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
    Write-Host "  [OK] Desktop shortcut created! / 妗岄潰蹇嵎鏂瑰紡宸插垱寤?" -ForegroundColor Green
    Write-Host "  Location: $shortcutPath" -ForegroundColor Gray
}

function Start-Service {
    $status = Get-CCConnectStatus
    if ($status -eq "not_found") {
        Write-Host ""
        Write-Host "  CC Connect not installed. / CC Connect 鏈畨瑁? -ForegroundColor Yellow
        $install = Read-Host "  Install now? / 鐜板湪瀹夎? (Y/N)"
        if ($install -eq "Y" -or $install -eq "y") {
            if (-not (Install-CCConnect)) { return }
        } else {
            return
        }
    }

    Write-Host ""
    Write-Host "  Starting CC Connect..." -ForegroundColor Cyan

    # Add npm global dir to PATH
    $npmGlobalDir = "$env:APPDATA\npm"
    if ($env:PATH -notlike "*$npmGlobalDir*") {
        $env:PATH = "$npmGlobalDir;$env:PATH"
    }

    # Find cc-connect.cmd
    $localCmd = Join-Path $scriptDir "node_modules\.bin\cc-connect.cmd"
    $globalCmd = Join-Path $npmGlobalDir "cc-connect.cmd"

    if (Test-Path $localCmd) {
        $ccCmd = $localCmd
        Write-Host "  Using local: $localCmd" -ForegroundColor Gray
    } elseif (Test-Path $globalCmd) {
        $ccCmd = $globalCmd
        Write-Host "  Using global: $globalCmd" -ForegroundColor Gray
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
    Write-Host "  [OK] CC Connect started! / 鍚姩鎴愬姛!" -ForegroundColor Green
    Write-Host "  Web UI: http://localhost:9820" -ForegroundColor Cyan
    Write-Host "  Opening browser in 3 seconds / 3绉掑悗鎵撳紑娴忚鍣?.." -ForegroundColor Gray
    Start-Sleep -Seconds 3
    Start-Process "http://localhost:9820"
}

function Stop-Service {
    Write-Host ""
    Write-Host "  Stopping CC Connect..." -ForegroundColor Cyan
    $processes = Get-Process -Name "cc-connect" -ErrorAction SilentlyContinue
    if ($processes) {
        $processes | Stop-Process -Force
        Write-Host "  [OK] Stopped. / 宸插仠姝? -ForegroundColor Green
    } else {
        Write-Host "  Not running. / 鏈繍琛? -ForegroundColor Yellow
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
    Write-Host "     CC Connect 鎺у埗闈㈡澘" -ForegroundColor Gray
    Write-Host "  =================================================" -ForegroundColor Cyan
    Write-Host ""

    $status = Show-Status

    Write-Host ""
    Write-Host "  [1] Start Service / 寮€濮嬫湇鍔? -ForegroundColor White
    Write-Host "  [2] Stop Service / 鍋滄鏈嶅姟" -ForegroundColor White
    Write-Host "  [3] Open Browser / 鎵撳紑娴忚鍣? -ForegroundColor White
    Write-Host "  [4] Start and Open Browser / 鍚姩骞舵墦寮€娴忚鍣? -ForegroundColor Green
    Write-Host "  [5] Create Desktop Shortcut / 鍒涘缓妗岄潰蹇嵎鏂瑰紡" -ForegroundColor White
    Write-Host "  [6] Exit / 閫€鍑? -ForegroundColor White
    Write-Host ""

    # First run guidance
    if ($firstRun) {
        Write-Host "  [TIP] First time? Press 5 to create a desktop shortcut" -ForegroundColor Yellow
        Write-Host "  [鎻愮ず] 棣栨浣跨敤锛熸寜 5 鍒涘缓妗岄潰蹇嵎鏂瑰紡" -ForegroundColor Yellow
        Write-Host ""
    }

    $choice = Read-Host "  Enter your choice / 璇疯緭鍏ラ€夐」 (1-6)"

    switch ($choice) {
        "1" { Start-Service; Write-Host ""; Read-Host "  Press Enter / 鎸夊洖杞︾户缁? }
        "2" { Stop-Service; Write-Host ""; Read-Host "  Press Enter / 鎸夊洖杞︾户缁? }
        "3" { Open-Browser; Write-Host ""; Read-Host "  Press Enter / 鎸夊洖杞︾户缁? }
        "4" { Start-Service; Write-Host ""; Read-Host "  Press Enter / 鎸夊洖杞︾户缁? }
        "5" {
            New-DesktopShortcut
            $firstRun = $false
            Write-Host ""
            Read-Host "  Press Enter / 鎸夊洖杞︾户缁?
        }
        "6" {
            Write-Host ""
            Write-Host "  Goodbye! / 鍐嶈!" -ForegroundColor Cyan
            Write-Host ""
            exit
        }
        default {
            Write-Host ""
            Write-Host "  Invalid choice / 鏃犳晥閫夐」锛岃杈撳叆 1-6" -ForegroundColor Red
            Start-Sleep -Seconds 1
        }
    }
}
