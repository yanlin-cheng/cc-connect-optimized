# CC Connect Control Panel
$Host.UI.RawUI.WindowTitle = "CC Connect Control Panel"

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
}

function Start-Service {
    Write-Host ""
    Write-Host "[START] Starting CC Connect service..." -ForegroundColor Green
    $env:PATH += ";C:\Users\cyl\AppData\Roaming\npm"
    Start-Process -FilePath "C:\Users\cyl\AppData\Roaming\npm\cc-connect.cmd" -WindowStyle Hidden
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
    $env:PATH += ";C:\Users\cyl\AppData\Roaming\npm"
    Start-Process -FilePath "C:\Users\cyl\AppData\Roaming\npm\cc-connect.cmd" -WindowStyle Hidden
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
