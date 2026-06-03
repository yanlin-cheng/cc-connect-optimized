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

I've been using CC Connect to chat with my AI assistant from my phone - it's amazing! But every morning I had to:

1. Open the terminal
2. Type `cc-connect` to start the service
3. Open the browser manually
4. Go to the Web UI

Every single day. It got annoying.

So I thought: what if I could just **double-click a file** and everything starts automatically? Service running, browser opens, ready to go. Add a shortcut to the desktop and it's one click away, forever.

That's exactly what this program does. No more terminal, no more commands. Just click and chat.

---

## ✨ What This Does

- **One click** → Service starts + browser opens automatically
- **Auto install** → If CC Connect isn't installed, it handles it for you
- **Smart detection** → Auto-detects and installs CC Connect if missing
- **Desktop shortcut** → Create once, click forever
- **Bilingual** → Chinese and English side by side

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

> **Important**: CC Connect needs at least one AI agent CLI to run. Without it, the Web UI won't start.

---

## 🚀 Quick Start

### Step 1: Download

**[Download CCConnect-Launcher.ps1](https://github.com/yanlin-cheng/cc-connect-optimized/releases/latest/download/CCConnect-Launcher.ps1)**

### Step 2: Run

**Right-click** the file → **"Run with PowerShell"**

That's it! CC Connect will be installed globally on your first run.

### Step 3: First Time Setup

1. It asks if you want to install CC Connect → press `Y`
2. Press `5` to create a desktop shortcut (so you don't need to find the file again)
3. Press `4` to start and open the Web UI
4. In the Web UI, configure your chat platform (Feishu is easiest - just scan a QR code!)

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

CC Connect is a bridge. It takes messages from your chat app, sends them to your AI agent, and sends the response back. Simple as that!

---

## ⚡ Keep Your PC Running

CC Connect runs as a service on your computer. If you turn off your PC or it goes to sleep, the service stops and your chat bot goes offline.

To keep it running 24/7:

### Method 1: Disable Sleep (Recommended)

1. Press `Win + I` to open **Settings**
2. Go to **System** → **Power & sleep** (or **电源和睡眠**)
3. Under **Sleep** (睡眠), set it to **Never** (从不)
4. Under **Screen** (屏幕), you can set it to turn off after a few minutes - this just turns off the display, the service keeps running

### Method 2: Create a High Performance Power Plan

1. Press `Win + R`, type `control`, press Enter
2. Go to **Hardware and Sound** → **Power Options** (硬件和声音 → 电源选项)
3. Click **Create a power plan** (创建电源计划) on the left
4. Select **High performance** (高性能), name it "Server Mode"
5. Set **Turn off the display** to whatever you want
6. Set **Put the computer to sleep** to **Never**
7. Click **Create**

Now when you want to keep CC Connect running overnight, just switch to this power plan.

---

## 🔧 Troubleshooting

| Problem | Solution |
|---------|----------|
| Service fails to start | Make sure you have an AI Agent CLI installed, see Prerequisites |
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
