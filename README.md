# CC Connect Optimized

An optimized version of [CC Connect](https://github.com/chenhg5/cc-connect) with a visual control panel. CC Connect bridges AI coding agents (Claude Code, Codex, Cursor, Gemini CLI) to chat platforms (Feishu/Lark, WeChat Work, DingTalk, Telegram, Slack, Discord, LINE).

Chat with your AI assistant from your phone, anytime.

## Prerequisites

Before using this tool, you need:

1. **Node.js**: https://nodejs.org/
2. **An AI Agent CLI** — install at least one:
   - **Claude Code**: https://docs.anthropic.com/en/docs/claude-code
   - **OpenAI Codex**: https://github.com/openai/codex
   - **Cursor**: https://cursor.sh
   - **Gemini CLI**: https://github.com/google-gemini/gemini-cli
   - **Qwen Code (通义千问)**: https://github.com/QwenLM/qwen-code
   - **Tencent CodeBuddy**: https://github.com/Tencent/CodeBuddy
   - **Xiaomi MiMo**: https://github.com/Xiaomi/mimo

> **Note**: CC Connect requires at least one AI agent CLI to run. The Web UI will not start without it.

## Quick Start

### 1. Download

**[Download CCConnect-Launcher.ps1](https://github.com/yanlin-cheng/cc-connect-optimized/releases/latest/download/CCConnect-Launcher.ps1)**

### 2. Run

1. Create a folder for CC Connect (e.g., `C:\CCConnect`)
2. Move `CCConnect-Launcher.ps1` into that folder
3. **Right-click** the file → **"Run with PowerShell"**

### 3. First Time

1. The script will ask if you want to install CC Connect (press `Y`)
2. CC Connect installs globally via npm
3. Press `5` to create a desktop shortcut for future use
4. Press `4` to start the service and open the Web UI
5. In the Web UI, configure your chat platform

### Windows Security Notice

When you run the script, Windows may show a security warning. This is normal for downloaded scripts:

1. Right-click `CCConnect-Launcher.ps1` → **Properties**
2. At the bottom, check **"Unblock"** → Click **OK**
3. Run the script again

Or run this command in PowerShell:
```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

## Control Panel

```
  =================================================
     CC Connect Control Panel
     CC Connect 控制面板
  =================================================

  Status: Installed (global) / 已安装 (全局)

  [1] Start Service / 开始服务
  [2] Stop Service / 停止服务
  [3] Open Browser / 打开浏览器
  [4] Start and Open Browser / 启动并打开浏览器
  [5] Create Desktop Shortcut / 创建桌面快捷方式
  [6] Exit / 退出
```

| Option | Description |
|--------|-------------|
| 1 | Start CC Connect and open the Web UI |
| 2 | Stop the running CC Connect service |
| 3 | Open Web UI in browser (if service is running) |
| 4 | Start service and open Web UI (one-click) |
| 5 | Create a desktop shortcut for quick access |
| 6 | Exit the control panel |

## Chat Platform Setup

After starting CC Connect, open the Web UI at http://localhost:9820 to configure your chat platform.

### Feishu / 飞书 (Recommended)

The easiest platform — just scan a QR code with your Feishu app.

**[Feishu Setup Guide](docs/feishu-setup.md)**

### WeChat Work / 企业微信

For enterprise use with WeChat Work.

**[WeChat Work Setup Guide](docs/wecom-setup.md)**

## How It Works

```
Your Phone (Feishu/WeChat)
    ↓ Send message
CC Connect (bridge)
    ↓ Forward to agent
AI Agent CLI (Claude Code/Codex/etc.)
    ↓ Generate response
CC Connect
    ↓ Send back
Your Phone (Feishu/WeChat)
```

## Important: Keep Your PC Running

CC Connect runs as a service on your computer. If you turn off your PC, the service stops and your chat bot goes offline.

**To keep it running overnight:**

1. Open **Settings** → **System** → **Power & sleep**
2. Set **Screen** to turn off after a few minutes (saves power)
3. Set **Sleep** to **Never** (keeps the service running)

Or use this command:
```powershell
powercfg -change -standby-timeout-ac 0
```

## Troubleshooting

### "No AI Agent CLI found"

You need to install at least one AI agent CLI. See [Prerequisites](#prerequisites) for the list of supported agents.

### "cc-connect is not recognized"

The script adds the npm global directory to PATH automatically. If you still see this error, try restarting PowerShell.

### Web UI doesn't open

1. Check if the cc-connect window shows any error messages
2. Make sure port 9820 is not used by another application
3. Try running `cc-connect` manually in PowerShell to see the error

## Credits

- [CC Connect](https://github.com/chenhg5/cc-connect) by chenhg5
- Optimized by yanlin-cheng with assistance from Claude Code

## License

MIT License
