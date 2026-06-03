# CC Connect Control Panel
$Host.UI.RawUI.WindowTitle = "CC Connect Launcher"

# Get script directory
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Check CC Connect installation status
function Get-CCConnectStatus {
    # Check local installation
    $localPath = Join-Path $ScriptDir "node_modules\.bin\cc-connect.cmd"
    if (Test-Path $localPath) {
        return @{
            Installed = $true
            Type = "local"
            Path = $localPath
        }
    }

    # Check global installation
    $globalPath = Get-Command cc-connect -ErrorAction SilentlyContinue
    if ($globalPath) {
        return @{
            Installed = $true
            Type = "global"
            Path = $globalPath.Source
        }
    }

    return @{
        Installed = $false
        Type = $null
        Path = $null
    }
}

# Install CC Connect
function Install-CCConnect {
    param(
        [string]$InstallPath
    )

    Write-Host ""
    Write-Host "  [INSTALL] Installing CC Connect..." -ForegroundColor Yellow
    Write-Host "  [LOCATION] $InstallPath" -ForegroundColor Cyan
    Write-Host ""

    # Check npm
    try {
        $npmVersion = npm --version
        Write-Host "  [INFO] npm version: $npmVersion" -ForegroundColor Cyan
    } catch {
        Write-Host "  [ERROR] npm not installed" -ForegroundColor Red
        Write-Host "  [DOWNLOAD] https://nodejs.org/" -ForegroundColor Red
        return $false
    }

    # Install to specified directory
    Push-Location $InstallPath
    npm install cc-connect
    Pop-Location

    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "  [DONE] CC Connect installed successfully!" -ForegroundColor Green
        return $true
    } else {
        Write-Host ""
        Write-Host "  [ERROR] Installation failed" -ForegroundColor Red
        return $false
    }
}

# Create desktop shortcut
function Create-DesktopShortcut {
    $desktopPath = [Environment]::GetFolderPath("Desktop")
    $shortcutPath = Join-Path $desktopPath "CCConnect Launcher.vbs"

    Write-Host ""
    Write-Host "  [SHORTCUT] Creating desktop shortcut..." -ForegroundColor Yellow

    # Create VBS shortcut
    $vbsContent = @"
Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "powershell -ExecutionPolicy Bypass -File ""$ScriptDir\CCConnect-Launcher.ps1""", 1, False
"@

    Set-Content -Path $shortcutPath -Value $vbsContent -Encoding UTF8

    Write-Host "  [DONE] Desktop shortcut created" -ForegroundColor Green
    Write-Host "  [PATH] $shortcutPath" -ForegroundColor Gray
}

# Start service
function Start-Service {
    Write-Host ""
    Write-Host "  [START] Starting CC Connect service..." -ForegroundColor Green

    $status = Get-CCConnectStatus
    if (-not $status.Installed) {
        Write-Host "  [ERROR] CC Connect not installed" -ForegroundColor Red
        Read-Host "  Press Enter to continue"
        return
    }

    Start-Process -FilePath $status.Path -WindowStyle Hidden
    Write-Host "  [DONE] Service started!" -ForegroundColor Green
    Write-Host ""
    Write-Host "  Web UI: http://localhost:9820" -ForegroundColor White
    Write-Host ""
    Read-Host "  Press Enter to continue"
}

# Stop service
function Stop-Service {
    Write-Host ""
    Write-Host "  [STOP] Stopping CC Connect service..." -ForegroundColor Red
    Stop-Process -Name "cc-connect" -Force -ErrorAction SilentlyContinue
    Write-Host "  [DONE] Service stopped!" -ForegroundColor Green
    Write-Host ""
    Read-Host "  Press Enter to continue"
}

# Open browser
function Open-Browser {
    Write-Host ""
    Write-Host "  [BROWSER] Opening Web UI..." -ForegroundColor Yellow
    Start-Process "http://localhost:9820"
    Write-Host "  [DONE] Browser opened!" -ForegroundColor Green
    Write-Host ""
    Read-Host "  Press Enter to continue"
}

# Start and open browser
function Start-AndOpen {
    Write-Host ""
    Write-Host "  [START] Starting CC Connect service..." -ForegroundColor Green

    $status = Get-CCConnectStatus
    if (-not $status.Installed) {
        Write-Host "  [ERROR] CC Connect not installed" -ForegroundColor Red
        Read-Host "  Press Enter to continue"
        return
    }

    Start-Process -FilePath $status.Path -WindowStyle Hidden
    Write-Host "  [WAIT] Waiting for service..." -ForegroundColor Yellow
    Start-Sleep -Seconds 5
    Write-Host "  [BROWSER] Opening Web UI..." -ForegroundColor Yellow
    Start-Process "http://localhost:9820"
    Write-Host "  [DONE] Service started, browser opened!" -ForegroundColor Green
    Write-Host ""
    Write-Host "  Web UI: http://localhost:9820" -ForegroundColor White
    Write-Host ""
    Read-Host "  Press Enter to continue"
}

# Main program
function Main {
    # Check installation status
    $status = Get-CCConnectStatus

    # If not installed, ask if want to install
    if (-not $status.Installed) {
        Clear-Host
        Write-Host ""
        Write-Host "  ==========================================" -ForegroundColor Cyan
        Write-Host "    CC Connect Launcher" -ForegroundColor Cyan
        Write-Host "  ==========================================" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "  [STATUS] CC Connect not installed" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "  Do you want to install CC Connect?" -ForegroundColor White
        Write-Host ""
        Write-Host "  [1] Install to current folder" -ForegroundColor Green
        Write-Host "  [2] Skip installation, open control panel" -ForegroundColor Yellow
        Write-Host "  [3] Exit" -ForegroundColor Gray
        Write-Host ""

        $choice = Read-Host "  Select option (1-3)"

        switch ($choice) {
            "1" {
                $installPath = $ScriptDir
                $success = Install-CCConnect -InstallPath $installPath
                if ($success) {
                    Create-DesktopShortcut
                }
            }
            "2" {
                # Skip installation, continue to control panel
            }
            "3" {
                Write-Host ""
                Write-Host "  Goodbye!" -ForegroundColor Cyan
                Start-Sleep -Seconds 1
                exit
            }
            default {
                Write-Host ""
                Write-Host "  Invalid choice" -ForegroundColor Red
                Start-Sleep -Seconds 2
            }
        }
    }

    # Show control panel
    Show-ControlPanel
}

# Control panel
function Show-ControlPanel {
    do {
        Clear-Host
        Write-Host ""
        Write-Host "  ==========================================" -ForegroundColor Cyan
        Write-Host "    CC Connect Launcher" -ForegroundColor Cyan
        Write-Host "  ==========================================" -ForegroundColor Cyan
        Write-Host ""

        # Show installation status
        $status = Get-CCConnectStatus
        if ($status.Installed) {
            Write-Host "  [STATUS] CC Connect installed ($($status.Type))" -ForegroundColor Green
            Write-Host "  [PATH] $($status.Path)" -ForegroundColor Gray
        } else {
            Write-Host "  [STATUS] CC Connect not installed" -ForegroundColor Yellow
        }

        # Check desktop shortcut
        $desktopPath = [Environment]::GetFolderPath("Desktop")
        $shortcutPath = Join-Path $desktopPath "CCConnect Launcher.vbs"
        if (Test-Path $shortcutPath) {
            Write-Host "  [SHORTCUT] Desktop shortcut exists" -ForegroundColor Green
        } else {
            Write-Host "  [SHORTCUT] Desktop shortcut not created" -ForegroundColor Yellow
        }

        Write-Host ""
        Write-Host "  ==========================================" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "   [1] Start Service" -ForegroundColor Green
        Write-Host "   [2] Stop Service" -ForegroundColor Red
        Write-Host "   [3] Open Browser" -ForegroundColor Yellow
        Write-Host "   [4] Start + Open Browser" -ForegroundColor Magenta
        Write-Host "   [5] Create Desktop Shortcut" -ForegroundColor Cyan
        Write-Host "   [6] Exit" -ForegroundColor Gray
        Write-Host ""
        Write-Host "  ==========================================" -ForegroundColor Cyan
        Write-Host ""

        $choice = Read-Host "  Select option (1-6)"

        switch ($choice) {
            "1" { Start-Service }
            "2" { Stop-Service }
            "3" { Open-Browser }
            "4" { Start-AndOpen }
            "5" { Create-DesktopShortcut }
            "6" {
                Write-Host ""
                Write-Host "  Goodbye!" -ForegroundColor Cyan
                Start-Sleep -Seconds 1
                exit
            }
            default {
                Write-Host ""
                Write-Host "  Invalid choice, try again!" -ForegroundColor Red
                Start-Sleep -Seconds 2
            }
        }
    } while ($true)
}

# Run main program
Main
