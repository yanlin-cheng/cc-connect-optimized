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

我用了 CC Connect 之后觉得非常好用，可以随时随地用手机跟 AI 助手对话。但有一点不方便：

- 每次都要打开终端，输入命令启动服务
- 启动后还要手动打开浏览器访问 Web UI
- 对于日常使用来说，这个流程太麻烦了

所以我就想，如果有一个程序，双击就能启动服务并打开浏览器，那该多方便！

---

## ✨ 这个程序能做什么

我做了一个控制面板，功能很简单：

1. **一键启动** - 启动 CC Connect 并自动打开网页界面
2. **自动安装** - 如果没装 CC Connect，会自动帮你全局安装
3. **代理检测** - 启动前检查有没有安装 AI 代理 CLI
4. **桌面快捷方式** - 创建快捷方式，以后直接从桌面启动
5. **中英双语** - 中英文并列显示

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

> **重要**：CC Connect 需要至少一个 AI 代理 CLI 才能运行。没有代理的话，网页界面无法启动。脚本会自动检测并提示你。

---

## 🚀 快速开始

### 第 1 步：下载

**[下载 CCConnect-Launcher.ps1](https://github.com/yanlin-cheng/cc-connect-optimized/releases/latest/download/CCConnect-Launcher.ps1)**

### 第 2 步：运行

1. 创建一个文件夹用于存放 CC Connect（例如 `C:\CCConnect`）
2. 将 `CCConnect-Launcher.ps1` 移动到该文件夹
3. **右键点击**文件 → **"使用 PowerShell 运行"**

### 第 3 步：首次使用

第一次运行时：

1. 脚本会询问是否安装 CC Connect → 按 `Y`
2. CC Connect 通过 npm 全局安装
3. 按 `5` 创建桌面快捷方式
4. 按 `4` 启动服务并打开网页界面
5. 在网页界面中配置聊天平台（飞书最简单，扫码就行！）

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

CC Connect 作为服务在你的电脑上运行。关机的话，服务就停了。

保持运行的方法：
1. **设置** → **系统** → **电源和睡眠**
2. 设置 **睡眠** 为 **从不**

或使用命令：
```powershell
powercfg -change -standby-timeout-ac 0
```

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
