# CC Connect Control Panel
$Host.UI.RawUI.WindowTitle = "CC Connect Control Panel"

# Get script directory
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

function Test-CCConnectInstalled {
    # Check local installation (script directory)
    $localPath = Join-Path $ScriptDir "node_modules\.bin\cc-connect.cmd"
    if (Test-Path $localPath) {
        return $true
    }
    return $false
}

function Get-CCConnectPath {
    # Return local installation path
    $localPath = Join-Path $ScriptDir "node_modules\.bin\cc-connect.cmd"
    if (Test-Path $localPath) {
        return $localPath
    }
    return $null
}

function Install-CCConnect {
    Write-Host ""
    Write-Host "[INSTALL] CC Connect is not installed." -ForegroundColor Yellow
    Write-Host "[INSTALL] Installing CC Connect to script directory..." -ForegroundColor Yellow
    Write-Host "[INSTALL] Location: $ScriptDir" -ForegroundColor Cyan
    Write-Host ""

    # Check if npm is installed
    try {
        $npmVersion = npm --version
        Write-Host "[INFO] npm version: $npmVersion" -ForegroundColor Cyan
    } catch {
        Write-Host "[ERROR] npm is not installed. Please install Node.js first." -ForegroundColor Red
        Write-Host "[ERROR] Download Node.js from: https://nodejs.org/" -ForegroundColor Red
        Read-Host "Press Enter to exit"
        exit 1
    }

    # Install cc-connect locally
    Write-Host "[INSTALL] Running: npm install cc-connect" -ForegroundColor Cyan
    Push-Location $ScriptDir
    npm install cc-connect
    Pop-Location

    if ($LASTEXITCODE -eq 0) {
        Write-Host "[DONE] CC Connect installed successfully!" -ForegroundColor Green
        Write-Host "[DONE] Installed to: $ScriptDir\node_modules\.bin\cc-connect.cmd" -ForegroundColor Green
    } else {
        Write-Host "[ERROR] Failed to install CC Connect." -ForegroundColor Red
        Read-Host "Press Enter to exit"
        exit 1
    }

    Write-Host ""
}

function Show-Menu {
    Clear-Host
    Write-Host ""
    Write-Host "  ==========================================" -ForegroundColor Cyan
    Write-Host "         CC Connect Control Panel" -ForegroundColor Cyan
    Write-Host "  ==========================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "   [1] Start Service" -ForegroundColor Green
    Write-Host "   [2] Stop Service" -ForegroundColor Red
    Write-Host "   [3] Open Browser" -ForegroundColor Yellow
    Write-Host "   [4] Start + Open Browser" -ForegroundColor Magenta
    Write-Host "   [5] Exit" -ForegroundColor Gray
    Write-Host ""
    Write-Host "  ==========================================" -ForegroundColor Cyan
    Write-Host ""

    # Show installation status
    if (Test-CCConnectInstalled) {
        $ccConnectPath = Get-CCConnectPath
        Write-Host "  Status: CC Connect installed" -ForegroundColor Green
        Write-Host "  Location: $ccConnectPath" -ForegroundColor Gray
    } else {
        Write-Host "  Status: CC Connect not installed" -ForegroundColor Yellow
        Write-Host "  Will install on first use" -ForegroundColor Gray
    }
    Write-Host ""
}

function Start-Service {
    Write-Host ""
    Write-Host "[START] Starting CC Connect service..." -ForegroundColor Green

    # Check if cc-connect is installed
    if (-not (Test-CCConnectInstalled)) {
        Install-CCConnect
    }

    $ccConnectPath = Get-CCConnectPath
    Start-Process -FilePath $ccConnectPath -WindowStyle Hidden
    Write-Host "[DONE] Service started!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Web UI: http://localhost:9820" -ForegroundColor White
    Write-Host "API Token: (See config.toml for your token)" -ForegroundColor White
    Write-Host ""
    Read-Host "Press Enter to continue"
}

function Stop-Service {
    Write-Host ""
    Write-Host "[STOP] Stopping CC Connect service..." -ForegroundColor Red
    Stop-Process -Name "cc-connect" -Force -ErrorAction SilentlyContinue
    Write-Host "[DONE] Service stopped!" -ForegroundColor Green
    Write-Host ""
    Read-Host "Press Enter to continue"
}

function Open-Browser {
    Write-Host ""
    Write-Host "[BROWSER] Opening Web UI..." -ForegroundColor Yellow
    Start-Process "http://localhost:9820"
    Write-Host "[DONE] Browser opened!" -ForegroundColor Green
    Write-Host ""
    Read-Host "Press Enter to continue"
}

function Start-AndOpen {
    Write-Host ""
    Write-Host "[START] Starting CC Connect service..." -ForegroundColor Green

    # Check if cc-connect is installed
    if (-not (Test-CCConnectInstalled)) {
        Install-CCConnect
    }

    $ccConnectPath = Get-CCConnectPath
    Start-Process -FilePath $ccConnectPath -WindowStyle Hidden
    Write-Host "[WAIT] Waiting for service..." -ForegroundColor Yellow
    Start-Sleep -Seconds 5
    Write-Host "[BROWSER] Opening Web UI..." -ForegroundColor Yellow
    Start-Process "http://localhost:9820"
    Write-Host "[DONE] Service started, browser opened!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Web UI: http://localhost:9820" -ForegroundColor White
    Write-Host "API Token: (See config.toml for your token)" -ForegroundColor White
    Write-Host ""
    Read-Host "Press Enter to continue"
}

# Main loop
do {
    Show-Menu
    $choice = Read-Host "Select option (1-5)"

    switch ($choice) {
        "1" { Start-Service }
        "2" { Stop-Service }
        "3" { Open-Browser }
        "4" { Start-AndOpen }
        "5" {
            Write-Host ""
            Write-Host "Goodbye!" -ForegroundColor Cyan
            Start-Sleep -Seconds 1
            exit
        }
        default {
            Write-Host ""
            Write-Host "Invalid choice, try again!" -ForegroundColor Red
            Start-Sleep -Seconds 2
        }
    }
} while ($true)
