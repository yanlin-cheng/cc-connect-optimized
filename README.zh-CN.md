# CC Connect 优化版

> 我用了 CC Connect 这个项目之后觉得非常好，但有一点不方便，就是作为日常应用的话，用代码来启动和停止服务比较麻烦。所以我做了这个控制面板，让使用更方便。

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

## 🎯 为什么做这个

我用了 CC Connect 之后觉得非常好用，随时随地用手机就能跟 AI 助手对话，特别方便。但有一点让我很烦：

每天早上都要重复同样的操作——打开终端、输入命令启动服务、再手动打开浏览器。日复一日，真的很麻烦。

我就想：要是能**双击一个文件**，服务自动启动、浏览器自动打开，那该多好啊！再把快捷方式放到桌面上，以后每天点一下就完事了。

这个程序就是这么来的。不用再敲命令，不用再开终端，点一下就能用。

---

## ✨ 这个程序能做什么

- **点一下** → 服务启动 + 浏览器自动打开
- **自动安装** → 没装 CC Connect？自动帮你装好
- **智能检测** → 启动前检查有没有 AI 代理 CLI
- **桌面快捷方式** → 创建一次，以后一直用
- **中英双语** → 中英文并列显示

---

## ⚠️ 前置要求

使用本工具前，你需要：

1. **Node.js**：https://nodejs.org/
2. **一个 AI 代理 CLI** - 至少安装一个：

| 代理 | 链接 |
|------|------|
| Claude Code | https://docs.anthropic.com/en/docs/claude-code |
| OpenAI Codex | https://github.com/openai/codex |
| Cursor | https://cursor.sh |
| Gemini CLI | https://github.com/google-gemini/gemini-cli |
| 通义千问 (Qwen Code) | https://github.com/QwenLM/qwen-code |
| 腾讯 CodeBuddy | https://github.com/Tencent/CodeBuddy |
| 小米 MiMo | https://github.com/Xiaomi/mimo |

> **重要**：CC Connect 需要至少一个 AI 代理 CLI 才能运行。没有代理的话，网页界面无法启动。

---

## 🚀 快速开始

### 第 1 步：下载

**[下载 CCConnect-Launcher.ps1](https://github.com/yanlin-cheng/cc-connect-optimized/releases/latest/download/CCConnect-Launcher.ps1)**

### 第 2 步：运行

**右键点击**文件 → **"使用 PowerShell 运行"**

就这样！第一次运行会自动帮你全局安装 CC Connect。

### 第 3 步：首次使用

1. 脚本会询问是否安装 CC Connect → 按 `Y`
2. 按 `5` 创建桌面快捷方式（以后就不用再找文件了）
3. 按 `4` 启动服务并打开网页界面
4. 在网页界面中配置聊天平台（飞书最简单，扫码就行！）

### Windows 安全提示

Windows 可能会显示安全警告，这是下载脚本的正常现象：

1. 右键点击 `CCConnect-Launcher.ps1` → **属性**
2. 勾选底部的 **"解除锁定"** → **确定**
3. 重新运行

或在 PowerShell 中运行：
```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

---

## 📋 控制面板

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

## 💬 聊天平台配置

启动 CC Connect 后，打开 http://localhost:9820 配置聊天平台。

**[飞书配置指南](docs/feishu-setup.md)** - 最简单！扫码就行。

**[企业微信配置指南](docs/wecom-setup.md)** - 适合企业用户。

---

## 💡 工作原理

```
你的手机（飞书/企业微信） → CC Connect → AI 代理 CLI → CC Connect → 你的手机
```

CC Connect 就是一个桥梁。它把聊天消息转发给 AI 代理，再把回复发回去。就这么简单！

---

## ⚡ 保持电脑运行

CC Connect 作为服务在你的电脑上运行。如果电脑关机或进入睡眠，服务就会停止，聊天机器人就下线了。

想让它 24 小时运行，可以这样做：

### 方法一：关闭睡眠（推荐）

1. 按 `Win + I` 打开 **设置**
2. 进入 **系统** → **电源和睡眠**
3. 在 **睡眠** 那里，选择 **从不**
4. **屏幕** 可以设成几分钟后关闭——这只是关显示器，服务还在运行

### 方法二：创建高性能电源计划

1. 按 `Win + R`，输入 `control`，回车
2. 进入 **硬件和声音** → **电源选项**
3. 左侧点击 **创建电源计划**
4. 选择 **高性能**，起个名字比如"服务器模式"
5. **关闭显示器** 随便设多久都行
6. **使计算机进入睡眠状态** 设为 **从不**
7. 点击 **创建**

以后晚上想让 CC Connect 一直跑，切换到这个电源计划就行。

---

## 🔧 常见问题

| 问题 | 解决方法 |
|------|----------|
| "未检测到 AI 代理" | 安装前置要求中列出的任意一个代理 |
| "cc-connect 不被识别" | 重启 PowerShell，脚本会自动添加 npm 全局目录到 PATH |
| 网页界面打不开 | 检查 cc-connect 窗口的错误信息，或手动运行 `cc-connect` |
| "此文件可能损害你的设备" | 右键 → 属性 → 解除锁定 → 确定 |

---

## 📧 联系方式

- 邮箱：yanlin.cheng@foxmail.com

---

## 🙏 致谢

- [CC Connect](https://github.com/chenhg5/cc-connect) 由 chenhg5 开发
- 由 yanlin-cheng 在 Claude Code 协助下优化

## 📄 许可证

MIT 许可证
