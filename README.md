# CC Connect Optimized

> I've been using CC Connect and it's great, but one thing bothered me: starting and stopping the service with commands every day was inconvenient. So I created this launcher to make it easier.

<p align="center">
  <a href="https://github.com/chenhg5/cc-connect/blob/main/LICENSE">
    <img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="License"/>
  </a>
</p>

<p align="center">
  <a href="./README.md">English</a> | <a href="./README.zh-CN.md">中文</a>
</p>

---

## 🎯 Why I Made This

I've been using CC Connect and it's really good, but there's one thing that bothered me:

- Every time I had to open the terminal and type commands to start the service
- After starting, I had to manually open the browser to access the Web UI
- For daily use, this workflow was too tedious

So I thought, what if there was a program where I could double-click to start the service and open the browser? That would be so much easier!

---

## ✨ What This Program Does

I created a simple launcher that does exactly what you need:

1. **One-click start/stop service** - No more typing commands
2. **Auto-open browser when starting** - Saves you the extra step
3. **Auto-detect and install CC Connect** - If not installed, it'll install it for you
4. **Bilingual support** - Works for both Chinese and English users

---

## 🚀 How to Use

### Step 1: Download the Program

Click to download: [CC-Connect-启动器.vbs](CC-Connect-启动器.vbs)

### Step 2: Put It in Your Preferred Folder

**This is important!** I recommend you:

1. Create a new folder, like `D:\MyTools\cc-connect\`
2. Put the downloaded VBS file there
3. CC Connect will be installed to that folder automatically

**Why do this?**
- Easy to manage, everything in one place
- Won't mess up your system directories
- Easy to delete later - just delete the folder

### Step 3: Double-Click to Run

Double-click `CC-Connect-启动器.vbs`, and you'll see a control panel:

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

**The first time you run it**, the program will automatically check if CC Connect is installed. If not, it'll install it to the current folder for you.

### Step 4: Add Desktop Shortcut (Recommended)

**This step is key!** Once set up, daily use becomes super convenient:

1. Right-click `CC-Connect-启动器.vbs`
2. Select "Create shortcut"
3. Move the shortcut to your desktop
4. Rename it to "CC Connect" or "AI Assistant"

**Daily workflow:**
- Morning: Double-click desktop shortcut → Select `[4]` → Service starts, browser opens
- Evening: Select `[2]` → Service stops

---

## 💡 Recommended Workflow: Use Feishu

I've tried several platforms, and **Feishu is by far the most convenient**. Highly recommend it!

### Why Feishu?

- ✅ **Scan QR code to connect** - No complicated setup
- ✅ **Supports WeChat QR code** - Don't need a Feishu account
- ✅ **Easiest configuration** - Much simpler than other platforms
- ✅ **Works on phone and computer** - Chat with AI anytime, anywhere

### How to Set It Up?

1. **Open Web UI** (use our launcher, select `[4]`)
2. **Create a project** - Click "Projects" → "Add Project"
3. **Add Feishu platform** - Click "Add Platform" → "Feishu" → "Scan QR Code"
4. **Scan the QR code** - Use Feishu app to scan
5. **Done!** - Find the bot in Feishu and start chatting

**That's it!** Much easier than configuring WeChat Work, DingTalk, or other platforms.

---

## 🔧 Real-World Tips

### 1. Power Settings (Important!)

If you want to keep your computer running overnight so you can chat with AI from your phone, you need to adjust power settings:

**How to set it:**
1. Press `Win + S`, search for "Power Plan"
2. Click "Edit Power Plan"
3. Set "Turn off the display" to 5 minutes (saves power)
4. Set "Put the computer to sleep" to "Never" (keeps running)

**Or use command line (run PowerShell as Administrator):**
```powershell
# Disable sleep
powercfg /change standby-timeout-ac 0
powercfg /change standby-timeout-dc 0

# Set display to turn off after 5 minutes
powercfg /change monitor-timeout-ac 5
powercfg /change monitor-timeout-dc 5
```

**Why do this?**
- Screen turns off automatically, saves power
- But computer won't sleep, CC Connect keeps running
- You can chat with AI from your phone anytime

### 2. Using the Web UI

Use our launcher, select `[4] Start + Open Browser`, and the browser will automatically open the Web UI.

In the Web UI you can:
- Create and manage projects
- Add chat platforms (Feishu, WeChat, etc.)
- View conversation history
- Configure various settings

### 3. Setting Up Project Spaces

**I recommend creating separate spaces for each project:**

1. In Web UI, create Project A, bind Feishu Bot A
2. Create Project B, bind Feishu Bot B
3. In Feishu, different bots correspond to different projects

**Benefits:**
- Each project has its own conversation space
- Won't get mixed up
- Easy to manage

---

## 📱 Daily Workflow

**Here's how I use it every day:**

1. **Morning at work:**
   - Double-click desktop shortcut
   - Select `[4] Start + Open Browser`
   - Browser automatically opens Web UI

2. **Set up project (if needed):**
   - In Web UI, create or switch projects
   - Add Feishu platform (just scan QR code)

3. **Use:**
   - Open Feishu on your phone
   - Find your bot
   - Start chatting!

4. **After work:**
   - Select `[2] Stop Service` in control panel
   - Or just close the control panel window (service keeps running)

---

## 📁 File Structure

```
cc-connect-optimized/
├── cc-connect-control.ps1          # Control panel script (bilingual)
├── CC-Connect-启动器.vbs           # Launcher (double-click to run)
├── README.md                       # This file
├── README.zh-CN.md                 # Chinese version
├── config.example.toml             # Example config
└── docs/
    ├── feishu-setup.md             # Feishu setup guide
    └── wecom-setup.md              # WeChat Work setup guide
```

---

## 📚 More Documentation

- [Feishu Setup Guide](docs/feishu-setup.md) - Detailed configuration steps
- [WeChat Work Setup Guide](docs/wecom-setup.md) - If you prefer WeChat Work
- [Original Project](https://github.com/chenhg5/cc-connect) - Full documentation

---

## 📧 Contact

- GitHub: [cc-connect-optimized](https://github.com/yanlin-cheng/cc-connect-optimized)
- Email: yanlin.cheng@foxmail.com

---

## 📄 License

MIT License - Based on [CC Connect](https://github.com/chenhg5/cc-connect)
