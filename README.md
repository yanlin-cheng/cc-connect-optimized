# CC Connect Optimized

> I've been using CC Connect and it's great, but typing commands every day was inconvenient. So I made a launcher that you can just double-click.

<p align="center">
  <a href="https://github.com/chenhg5/cc-connect/blob/main/LICENSE">
    <img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="License"/>
  </a>
</p>

<p align="center">
  <a href="./README.md">English</a> | <a href="./README.zh-CN.md">中文</a>
</p>

---

## 🎯 What Is This

CC Connect is a tool that connects AI on your computer to chat apps on your phone. I've been using it and it's good, but starting it with commands every day was annoying. So I made a launcher:

- Double-click to start service
- Auto-open browser
- Auto-detect and install dependencies
- Bilingual support (English + Chinese)

---

## 🚀 How to Use

### Step 1: Download

Download these two files and put them in the same folder:

- [CC-Connect-启动器.bat](https://raw.githubusercontent.com/yanlin-cheng/cc-connect-optimized/main/CC-Connect-启动器.bat)
- [cc-connect-control.ps1](https://raw.githubusercontent.com/yanlin-cheng/cc-connect-optimized/main/cc-connect-control.ps1)

**Tip**: Create a dedicated folder, like `D:\MyTools\cc-connect\`, and put the files there.

### Step 2: Run

Double-click `CC-Connect-启动器.bat`, and you'll see the control panel:

```
==========================================
  CC Connect Control Panel
  CC Connect 控制面板
==========================================

  [1] Start Service / 启动服务
  [2] Stop Service / 停止服务
  [3] Open Browser / 打开浏览器
  [4] Start + Open Browser / 启动+打开浏览器
  [5] Exit / 退出

==========================================
```

The first run will automatically install CC Connect to the current folder.

### Step 3: Add Desktop Shortcut

Right-click `CC-Connect-启动器.bat` → Create shortcut → Move to desktop

Then just double-click the desktop shortcut every day.

---

## 💡 Recommendation: Use Feishu

I tried several platforms, and Feishu is the easiest:

- Scan QR code to connect, no manual config needed
- Supports WeChat QR code
- Works on phone and computer

**Setup steps**:
1. Open Web UI with the launcher (select `[4]`)
2. Create project → Add Feishu platform → Scan QR code
3. Find the bot in Feishu and start chatting

---

## 🔧 Power Settings

To keep your computer running overnight:

1. Search "Power Plan" → Edit power plan
2. Turn off display: 5 minutes
3. Put computer to sleep: Never

Or use command line (Admin PowerShell):
```powershell
powercfg /change standby-timeout-ac 0
powercfg /change monitor-timeout-ac 5
```

---

## 📁 File Structure

```
cc-connect-optimized/
├── CC-Connect-启动器.bat           # Launcher (double-click to run)
├── cc-connect-control.ps1          # Control panel script
├── README.md                       # This file
├── README.zh-CN.md                 # Chinese version
└── docs/
    ├── feishu-setup.md             # Feishu setup guide
    └── wecom-setup.md              # WeChat Work setup guide
```

---

## 📚 More Documentation

- [Feishu Setup Guide](docs/feishu-setup.md)
- [WeChat Work Setup Guide](docs/wecom-setup.md)
- [Original Project](https://github.com/chenhg5/cc-connect)

---

## 🙏 Credits

- Thanks to [CC Connect](https://github.com/chenhg5/cc-connect) for the excellent tool
- This project was developed with [Claude Code](https://claude.ai/code)

---

## 📧 Contact

- GitHub: [cc-connect-optimized](https://github.com/yanlin-cheng/cc-connect-optimized)
- Email: yanlin.cheng@foxmail.com

---

## 📄 License

MIT License
