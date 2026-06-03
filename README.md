# CC Connect Optimized

> 我用了 CC Connect 之后觉得非常好，但每天用命令行启动服务太麻烦了。所以我做了这个控制面板，双击就能用。

<p align="center">
  <a href="https://github.com/chenhg5/cc-connect/blob/main/LICENSE">
    <img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="License"/>
  </a>
  <a href="https://nodejs.org">
    <img src="https://img.shields.io/badge/Node.js-18+-green.svg" alt="Node.js"/>
  </a>
</p>

<p align="center">
  <a href="./README.md">English</a> | <a href="./README.zh-CN.md">中文</a>
</p>

---

## 🎯 Why I Made This

I've been using CC Connect to chat with my AI assistant from my phone, and it's really good. But there's one thing that bothered me:

- Every day I had to open the terminal and type commands to start the service
- After starting, I had to manually open the browser to access the Web UI
- For daily use, this workflow was too tedious

So I thought: what if there was a program where I could double-click to start everything? That would be so much easier!

---

## ✨ What This Does

I made a simple control panel that:

1. **One-click start** - Starts CC Connect and opens the Web UI automatically
2. **Auto-install** - If CC Connect isn't installed, it installs it for you (globally via npm)
3. **Agent detection** - Checks if you have an AI agent CLI installed before starting
4. **Desktop shortcut** - Creates a shortcut so you can launch from your desktop
5. **Bilingual** - Chinese and English side by side

---

## ⚠️ Prerequisites

Before using this tool, you need:

1. **Node.js**: https://nodejs.org/
2. **An AI Agent CLI** - install at least one:

| Agent | Link |
|-------|------|
| Claude Code | https://docs.anthropic.com/en/docs/claude-code |
| OpenAI Codex | https://github.com/openai/codex |
| Cursor | https://cursor.sh |
| Gemini CLI | https://github.com/google-gemini/gemini-cli |
| Qwen Code (通义千问) | https://github.com/QwenLM/qwen-code |
| Tencent CodeBuddy | https://github.com/Tencent/CodeBuddy |
| Xiaomi MiMo | https://github.com/Xiaomi/mimo |

> **Important**: CC Connect needs at least one AI agent CLI to run. Without it, the Web UI won't start. The script will detect this and show you a helpful error message.

---

## 🚀 Quick Start

### Step 1: Download

**[Download CCConnect-Launcher.ps1](https://github.com/yanlin-cheng/cc-connect-optimized/releases/latest/download/CCConnect-Launcher.ps1)**

### Step 2: Run

1. Create a folder for CC Connect (e.g., `C:\CCConnect`)
2. Move `CCConnect-Launcher.ps1` into that folder
3. **Right-click** the file → **"Run with PowerShell"**

### Step 3: First Time Setup

The first time you run it:

1. It asks if you want to install CC Connect → press `Y`
2. CC Connect installs globally via npm
3. Press `5` to create a desktop shortcut
4. Press `4` to start and open the Web UI
5. In the Web UI, configure your chat platform (Feishu is easiest - just scan a QR code!)

### Windows Security Notice

Windows may show a security warning for downloaded scripts. This is normal:

1. Right-click `CCConnect-Launcher.ps1` → **Properties**
2. Check **"Unblock"** at the bottom → **OK**
3. Run again

Or run in PowerShell:
```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

---

## 📋 Control Panel

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

---

## 💬 Chat Platform Setup

After starting CC Connect, open http://localhost:9820 to configure your chat platform.

**[Feishu / 飞书 Setup Guide](docs/feishu-setup.md)** - Easiest! Just scan a QR code.

**[WeChat Work / 企业微信 Setup Guide](docs/wecom-setup.md)** - For enterprise users.

---

## 💡 How It Works

```
Your Phone (Feishu/WeChat) → CC Connect → AI Agent CLI → CC Connect → Your Phone
```

CC Connect is a bridge. It takes messages from your chat app, sends them to your AI agent, and sends the response back. That's it!

---

## ⚡ Keep Your PC Running

CC Connect runs as a service on your computer. If you turn off your PC, the service stops.

To keep it running overnight:
1. **Settings** → **System** → **Power & sleep**
2. Set **Sleep** to **Never**

Or use:
```powershell
powercfg -change -standby-timeout-ac 0
```

---

## 🔧 Troubleshooting

| Problem | Solution |
|---------|----------|
| "No AI Agent CLI found" | Install one of the agents listed in Prerequisites |
| "cc-connect is not recognized" | Restart PowerShell, the script adds npm global dir to PATH |
| Web UI doesn't open | Check the cc-connect window for error messages, or run `cc-connect` manually |
| "This file may harm your device" | Right-click → Properties → Unblock → OK |

---

## 📧 Contact

- Email: yanlin.cheng@foxmail.com

---

## 🙏 Credits

- [CC Connect](https://github.com/chenhg5/cc-connect) by chenhg5
- Optimized by yanlin-cheng with assistance from Claude Code

## 📄 License

MIT License
