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

Click the links below to download directly (download both files):

- [Download CCConnect-Launcher.vbs](https://github.com/yanlin-cheng/cc-connect-optimized/releases/download/v1.0.0/CCConnect-Launcher.vbs)
- [Download CCConnect-Launcher.ps1](https://github.com/yanlin-cheng/cc-connect-optimized/releases/download/v1.0.0/CCConnect-Launcher.ps1)

**Tip**: Create a dedicated folder, like `D:\MyTools\cc-connect\`, and put both files there.

### Step 2: Run

Double-click `CCConnect-Launcher.vbs`, and the program will automatically:
- Check if CC Connect is installed (local or global)
- If not installed, ask if you want to install to current folder
- Create a desktop shortcut after installation

### Step 3: Use Desktop Shortcut

Just double-click the "CCConnect 启动器" shortcut on your desktop from now on.

---

## 💡 Recommendation: Use Feishu

I tried several platforms, and Feishu is the easiest:

- Scan QR code in Web UI to connect, no manual config needed
- Works on phone and computer
- Simplest configuration

**Setup steps**:
1. Open Web UI with the launcher (select `[4]`)
2. Create project → Add Feishu platform → Click "Scan QR Code"
3. Use Feishu App to scan the QR code (not WeChat, use Feishu App)
4. Find the bot in Feishu and start chatting

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
├── CCConnect-Launcher.vbs          # Launcher (double-click to run)
├── CCConnect-Launcher.ps1          # Control panel script
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
