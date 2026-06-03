# CC Connect Optimized

This is an optimized version of [CC Connect](https://github.com/wildancv/cc-connect) with a visual control panel that makes it easy for anyone to use.

## Quick Start

### Download

Download the launcher script:

**[Download CCConnect-Launcher.ps1](https://github.com/yanlin-cheng/cc-connect-optimized/releases/latest/download/CCConnect-Launcher.ps1)**

### Install

1. Create a folder where you want to install CC Connect
2. Move the downloaded `CCConnect-Launcher.ps1` into that folder
3. Right-click the file -> Select **"Run with PowerShell"**

That's it! The control panel will guide you through the rest.

### First Time Setup

When you run the script for the first time:

1. If CC Connect is not installed, it will ask if you want to install it (type `Y` and press Enter)
2. After installation, press `5` to create a desktop shortcut for easy access
3. Press `4` to start the service and open the Web UI
4. In the Web UI, configure your chat platform (Feishu is recommended - just scan a QR code!)

### Windows Security Notice

When you run the script, Windows may show a security warning. This is normal for downloaded scripts. To fix this:

1. Right-click `CCConnect-Launcher.ps1` -> **Properties**
2. At the bottom, check **"Unblock"** -> Click **OK**
3. Run the script again

Or run this command in PowerShell:
```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

## What's Different?

This optimized version adds:

- **Visual Control Panel**: A menu-based interface that's easy to use
- **One-Click Install**: Automatically installs CC Connect if not found
- **Desktop Shortcut**: Create a shortcut for quick access
- **Smart Detection**: Finds CC Connect whether installed locally or globally
- **Auto-Start Browser**: Opens the Web UI when you start the service

## Usage

The control panel has these options:

| Option | Description |
|--------|-------------|
| 1 | Start CC Connect |
| 2 | Stop CC Connect |
| 3 | Open Web UI in browser |
| 4 | Start and open Web UI |
| 5 | Create desktop shortcut |
| 6 | Exit |

## Configuration

After starting CC Connect, open the Web UI at http://localhost:9820 to configure your chat platform.

### Feishu (Recommended)

The easiest platform to set up. Just scan a QR code with your Feishu app.

**[Feishu Setup Guide](docs/feishu-setup.md)**

### WeChat Work

For enterprise use with WeChat Work.

**[WeChat Work Setup Guide](docs/wecom-setup.md)**

## Requirements

- **Windows 10/11**
- **Node.js**: https://nodejs.org/
- **PowerShell**: Built into Windows
- **Claude Code CLI**: Must be installed and in your PATH

## Important: Keep Your PC Running

CC Connect runs as a service on your computer. If you turn off your PC:

- The service stops
- Your chat bot goes offline
- Messages won't get responses

**To keep it running overnight:**

1. Open **Settings** -> **System** -> **Power & sleep**
2. Set **Screen** to turn off after a few minutes (saves power)
3. Set **Sleep** to **Never** (keeps the service running)
4. Or use: `powercfg -change -standby-timeout-ac 0`

## Credits

- [CC Connect](https://github.com/wildancv/cc-connect) by wildancv
- Optimized by yanlin-cheng with assistance from Claude Code

## License

MIT License
