# CC Connect Optimized

> An optimized version of [CC Connect](https://github.com/chenhg5/cc-connect) with visual control panel for easier management.

<p align="center">
  <img src="./docs/images/banner.svg" alt="CC-Connect Banner" width="800"/>
</p>

<p align="center">
  <a href="https://github.com/chenhg5/cc-connect/blob/main/LICENSE">
    <img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="License"/>
  </a>
  <a href="https://github.com/chenhg5/cc-connect/releases">
    <img src="https://img.shields.io/github/v/release/chenhg5/cc-connect?include_prereleases" alt="Release"/>
  </a>
</p>

<p align="center">
  <a href="./README.md">English</a> | <a href="./README.zh-CN.md">中文</a>
</p>

---

## ✨ What's New

### 🎮 Visual Control Panel

**Problem with original version:**
- Need to type commands manually to start/stop service
- No graphical interface for management
- Chinese and English users need separate versions

**Our solution:**
- ✅ Visual control panel (PowerShell script)
- ✅ Bilingual interface (English + Chinese)
- ✅ One-click start/stop service
- ✅ One-click open Web UI
- ✅ Double-click to run, no commands needed

---

## 🚀 Quick Start

### Step 1: Download Control Panel

Download the control panel files:
- [Start-CC-Connect.vbs](Start-CC-Connect.vbs) (English version)
- [启动CC-Connect控制面板.vbs](启动CC-Connect控制面板.vbs) (中文版)

**💡 Tip:** Create a folder (e.g., `D:\MyTools\cc-connect\`) and put the VBS file there. CC Connect will be installed to that folder automatically.

### Step 2: Run Control Panel

**English Users:** Double-click `Start-CC-Connect.vbs`

**中文用户：** 双击 `启动CC-Connect控制面板.vbs`

### Step 3: Start Service

In the control panel, select:
```
[4] Start + Open Browser
```

This will:
1. Install CC Connect to script directory (if not installed)
2. Start CC Connect service
3. Open Web UI in browser (http://localhost:9820)

### Step 4: Configure Project in Web UI

1. Open Web UI in browser
2. Login with API Token (auto-generated, shown in control panel)
3. Click "Projects" → "Add Project"
4. Fill in:
   - **Project Name:** e.g., `my-project`
   - **Work Directory:** Your project folder path
   - **Agent Type:** `claudecode`

### Step 5: Add Chat Platform

**Feishu (飞书):**
1. In project settings, click "Add Platform"
2. Select "Feishu"
3. Click "Scan QR Code" button
4. Scan with Feishu App
5. Configuration will be auto-saved

**WeChat Work (企业微信):**
1. In project settings, click "Add Platform"
2. Select "WeChat Work"
3. Choose "WebSocket" mode
4. Fill in `BotID` and `Secret`

> 📖 **Detailed guides:**
> - [Feishu Setup Guide](docs/feishu-setup.md)
> - [WeChat Work Setup Guide](docs/wecom-setup.md)

### Step 6: Use on Mobile

1. Open Feishu/WeChat on your phone
2. Find your bot (search by bot name)
3. Start chatting!

---

## 💡 Recommended Workflow

### Best Practice: Web UI + Direct Chat

**This is the most convenient way:**

1. **Open Web UI** → Create project → Scan QR code to connect Feishu
2. **Configure WeChat Work** (optional) → More convenient for mobile
3. **Direct chat with bot** → No need to create multiple groups
4. **Create new sessions** → Use `/new` for different tasks

### Why This Workflow?

- ✅ **No group chat needed** - Direct private chat with bot
- ✅ **Multiple bots** - Each project has its own bot
- ✅ **Session management** - Use `/new`, `/list`, `/switch`
- ✅ **Easy switching** - Switch between projects in Web UI

### Daily Workflow

1. **Morning:** Double-click desktop shortcut → Select `[4] Start + Open Browser`
2. **Configure:** Set up project in Web UI if needed
3. **Use:** Chat with AI on mobile (Feishu/WeChat)
4. **Evening:** Select `[2] Stop Service` in control panel

---

## 🔑 About Keys

### Auto-generated (No manual configuration)

- **Management API Token** - Web UI login credential
- **Bridge Token** - Internal communication credential

### Manual Configuration Required

- **Feishu `app_id` / `app_secret`** - Get from Feishu Open Platform (or scan QR code in Web UI)
- **WeChat Work `bot_id` / `bot_secret`** - Get from WeChat Work Admin

---

## 📁 File Structure

```
cc-connect-optimized/
├── cc-connect-control.ps1          # Control panel script
├── Start-CC-Connect.vbs            # English launcher
├── 启动CC-Connect控制面板.vbs       # Chinese launcher
├── 启动控制面板-中文.bat            # Batch launcher
├── README.md                       # This file
├── README.zh-CN.md                 # Chinese version
├── config.example.toml             # Example config
└── docs/
    ├── feishu-setup.md             # Feishu setup guide
    └── wecom-setup.md              # WeChat Work setup guide
```

---

## 📚 Documentation

- [Feishu Setup Guide](docs/feishu-setup.md) - How to connect Feishu
- [WeChat Work Setup Guide](docs/wecom-setup.md) - How to connect WeChat Work
- [Original Project](https://github.com/chenhg5/cc-connect) - Full documentation

---

## 📧 Contact

- GitHub: [cc-connect-optimized](https://github.com/yanlin-cheng/cc-connect-optimized)
- Email: yanlin.cheng@foxmail.com

---

## 📄 License

MIT License - Based on [CC Connect](https://github.com/chenhg5/cc-connect)
