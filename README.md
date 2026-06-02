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

### Step 1: Install CC Connect

```bash
npm install -g cc-connect
```

### Step 2: Run Control Panel

**English Users:** Double-click `Start-CC-Connect.vbs`

**中文用户：** 双击 `启动CC-Connect控制面板.vbs`

### Step 3: Start Service

In the control panel, select:
```
[4] Start + Open Browser
```

This will:
1. Start CC Connect service
2. Open Web UI in browser (http://localhost:9820)

### Step 4: Configure Project

1. Open Web UI in browser
2. Login with API Token (auto-generated, shown in control panel)
3. Create your project
4. Set work directory (your project folder)

### Step 5: Add Chat Platform

**Feishu (飞书):**
1. Visit [Feishu Open Platform](https://open.feishu.cn/)
2. Create enterprise self-built application
3. Get `app_id` and `app_secret`
4. In Web UI, add Feishu platform

**WeChat Work (企业微信):**
1. Login to [WeChat Work Admin](https://work.weixin.qq.com/wework_admin/frame)
2. Create intelligent bot
3. Get `bot_id` and `bot_secret`
4. In Web UI, add WeChat Work platform

### Step 6: Use on Mobile

1. Open Feishu/WeChat on your phone
2. Find your bot
3. Start chatting!

---

## 💡 Usage Tips

### Create Desktop Shortcut (Recommended)

After testing successfully, create a desktop shortcut:

1. Right-click `Start-CC-Connect.vbs`
2. Select "Create shortcut"
3. Move shortcut to desktop

### Daily Workflow

1. **Morning:** Double-click desktop shortcut → Select `[4] Start + Open Browser`
2. **Use:** Chat with AI on mobile (Feishu/WeChat)
3. **Evening:** Select `[2] Stop Service` in control panel

---

## 🔑 About Keys

### Auto-generated (No manual configuration)

- **Management API Token** - Web UI login credential
- **Bridge Token** - Internal communication credential

### Manual Configuration Required

- **Feishu `app_id` / `app_secret`** - Get from Feishu Open Platform
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
└── docs/                           # Original docs
```

---

## 📚 More Documentation

- [Original Project](https://github.com/chenhg5/cc-connect)
- [Feishu Guide](docs/feishu.md)
- [WeChat Work Guide](docs/wecom.md)
- [DingTalk Guide](docs/dingtalk.md)
- [Telegram Guide](docs/telegram.md)

---

## 📧 Contact

- GitHub: [cc-connect-optimized](https://github.com/your-username/cc-connect-optimized)
- Email: yanlin.cheng@foxmail.com

---

## 📄 License

MIT License - Based on [CC Connect](https://github.com/chenhg5/cc-connect)
