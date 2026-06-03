# CC Connect 优化版

[CC Connect](https://github.com/chenhg5/cc-connect) 的优化版本，增加了可视化控制面板。CC Connect 可以将 AI 编程代理（Claude Code、Codex、Cursor、Gemini CLI）连接到聊天平台（飞书、企业微信、钉钉、Telegram、Slack、Discord、LINE）。

随时随地用手机和你的 AI 助手对话。

## 前置要求

使用本工具前，你需要：

1. **Node.js**：https://nodejs.org/
2. **一个 AI 代理 CLI** — 至少安装一个：
   - **Claude Code**：https://docs.anthropic.com/en/docs/claude-code
   - **OpenAI Codex**：https://github.com/openai/codex
   - **Cursor**：https://cursor.sh
   - **Gemini CLI**：https://github.com/google-gemini/gemini-cli
   - **通义千问 (Qwen Code)**：https://github.com/QwenLM/qwen-code
   - **腾讯 CodeBuddy**：https://github.com/Tencent/CodeBuddy
   - **小米 MiMo**：https://github.com/Xiaomi/mimo

> **注意**：CC Connect 需要至少一个 AI 代理 CLI 才能运行。没有代理的话，Web 界面无法启动。

## 快速开始

### 1. 下载

**[下载 CCConnect-Launcher.ps1](https://github.com/yanlin-cheng/cc-connect-optimized/releases/latest/download/CCConnect-Launcher.ps1)**

### 2. 运行

1. 创建一个文件夹用于存放 CC Connect（例如 `C:\CCConnect`）
2. 将 `CCConnect-Launcher.ps1` 移动到该文件夹
3. **右键点击**文件 → **"使用 PowerShell 运行"**

### 3. 首次使用

1. 脚本会询问是否安装 CC Connect（按 `Y`）
2. CC Connect 通过 npm 全局安装
3. 按 `5` 创建桌面快捷方式，方便以后使用
4. 按 `4` 启动服务并打开网页界面
5. 在网页界面中配置聊天平台

### Windows 安全提示

运行脚本时，Windows 可能会显示安全警告。这是下载脚本的正常现象：

1. 右键点击 `CCConnect-Launcher.ps1` → **属性**
2. 在底部勾选 **"解除锁定"** → 点击 **确定**
3. 重新运行脚本

或者在 PowerShell 中运行：
```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

## 控制面板

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

| 选项 | 说明 |
|------|------|
| 1 | 启动 CC Connect 并打开网页界面 |
| 2 | 停止正在运行的 CC Connect 服务 |
| 3 | 在浏览器中打开网页界面（如果服务正在运行） |
| 4 | 启动服务并打开网页界面（一键操作） |
| 5 | 创建桌面快捷方式，方便快速启动 |
| 6 | 退出控制面板 |

## 聊天平台配置

启动 CC Connect 后，打开网页界面 http://localhost:9820 来配置聊天平台。

### 飞书（推荐）

最容易配置的平台，只需用飞书 App 扫码即可。

**[飞书配置指南](docs/feishu-setup.md)**

### 企业微信

适合企业用户使用。

**[企业微信配置指南](docs/wecom-setup.md)**

## 工作原理

```
你的手机（飞书/企业微信）
    ↓ 发送消息
CC Connect（桥接）
    ↓ 转发给代理
AI 代理 CLI（Claude Code/Codex 等）
    ↓ 生成回复
CC Connect
    ↓ 发送回去
你的手机（飞书/企业微信）
```

## 重要：保持电脑运行

CC Connect 作为服务在你的电脑上运行。如果关机，服务会停止，聊天机器人会下线。

**保持运行的方法：**

1. 打开 **设置** → **系统** → **电源和睡眠**
2. 设置 **屏幕** 几分钟后关闭（节省电力）
3. 设置 **睡眠** 为 **从不**（保持服务运行）

或使用命令：
```powershell
powercfg -change -standby-timeout-ac 0
```

## 常见问题

### "未检测到 AI 代理"

你需要安装至少一个 AI 代理 CLI。参见[前置要求](#前置要求)中的支持列表。

### "cc-connect 不被识别"

脚本会自动将 npm 全局目录添加到 PATH。如果仍然报错，请尝试重启 PowerShell。

### 网页界面打不开

1. 检查 cc-connect 窗口是否显示错误信息
2. 确认端口 9820 没有被其他程序占用
3. 尝试在 PowerShell 中手动运行 `cc-connect` 查看错误

## 致谢

- [CC Connect](https://github.com/chenhg5/cc-connect) 由 chenhg5 开发
- 由 yanlin-cheng 在 Claude Code 协助下优化

## 许可证

MIT 许可证
