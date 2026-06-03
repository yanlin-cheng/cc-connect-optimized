# CC Connect 优化版

> 基于 [CC Connect](https://github.com/chenhg5/cc-connect) 的优化版本，增加了可视化控制面板，让管理更简单。

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

## ✨ 优化内容

### 🎮 新增：可视化控制面板

**原项目问题：**
- 需要手动输入命令启动/停止服务
- 启动服务后需要手动打开 Web UI

**我们的解决方案：**
- ✅ 可视化控制面板（PowerShell 脚本）
- ✅ 中英文双语界面，一个界面服务所有用户
- ✅ 一键启动/停止服务
- ✅ 一键打开 Web UI
- ✅ 双击即可运行，无需输入命令
- ✅ 自动安装 CC Connect 到脚本所在目录

> **说明：** 原项目支持多国语言，并自带 Web UI。我们的优化是提供了一个便捷的启动器，将服务启动和 Web UI 访问合二为一。

---

## 🚀 快速开始

### 第 1 步：下载控制面板

下载控制面板文件：
- [CC-Connect-启动器.vbs](CC-Connect-启动器.vbs)（中英文双语 / Bilingual）

**💡 提示：** 创建一个文件夹（如 `D:\MyTools\cc-connect\`），把 VBS 文件放进去。CC Connect 会自动安装到该文件夹。

**💡 Tip:** Create a folder (e.g., `D:\MyTools\cc-connect\`) and put the VBS file there. CC Connect will be installed to that folder automatically.

### 第 2 步：运行控制面板

**中文用户：** 双击 `启动CC-Connect控制面板.vbs`

**English Users:** Double-click `Start-CC-Connect.vbs`

### 第 3 步：启动服务

在控制面板中选择：
```
[4] Start + Open Browser
```

这会：
1. 安装 CC Connect 到脚本所在目录（如未安装）
2. 启动 CC Connect 服务
3. 在浏览器中打开 Web UI（http://localhost:9820）

### 第 4 步：在 Web UI 中配置项目

1. 在浏览器中打开 Web UI
2. 使用 API Token 登录（首次运行时自动生成，见控制面板显示）
3. 点击「项目」→「添加项目」
4. 填写项目信息：
   - **项目名称：** 如 `my-project`
   - **工作目录：** 你的项目文件夹路径
   - **Agent 类型：** `claudecode`

### 第 5 步：添加聊天平台

**飞书接入：**
1. 在项目设置中点击「添加平台」
2. 选择「飞书」
3. 点击「扫码创建」按钮
4. 用飞书 App 扫描二维码
5. 配置会自动写入

**企业微信接入：**
1. 在项目设置中点击「添加平台」
2. 选择「企业微信」
3. 选择「WebSocket」模式
4. 填入 `BotID` 和 `Secret`

> 📖 **详细指南：**
> - [飞书接入指南](docs/feishu-setup.md)
> - [企业微信接入指南](docs/wecom-setup.md)

### 第 6 步：手机使用

1. 在手机上打开飞书/微信
2. 找到你的机器人（搜索机器人名称）
3. 开始对话！

---

## 💡 推荐工作流程

### 最佳实践：Web UI + 直接对话

**这是最方便的方式：**

1. **打开 Web UI** → 新建项目 → 扫码接入飞书
2. **配置企业微信**（可选）→ 更方便手机使用
3. **直接与机器人对话** → 不需要建立多个群聊
4. **创建新会话** → 使用 `/new` 处理不同任务

### 为什么推荐这种方式？

- ✅ **不需要群聊** - 直接与机器人私聊
- ✅ **多个机器人** - 每个项目有自己的机器人
- ✅ **会话管理** - 使用 `/new`、`/list`、`/switch`
- ✅ **方便切换** - 在 Web UI 中切换项目

### 日常使用流程

1. **早上：** 双击桌面快捷方式 → 选择 `[4] Start + Open Browser`
2. **配置：** 如需要，在 Web UI 中设置项目
3. **使用：** 在手机上通过飞书/微信与 AI 对话
4. **晚上：** 在控制面板中选择 `[2] Stop Service`

---

## 🔋 电源管理设置

**保持电脑运行同时关闭屏幕（适合夜间任务）：**

### Windows 设置方法

1. **打开电源计划：**
   - 按 `Win + S`，搜索"电源计划"或"Power Plan"
   - 点击"编辑电源计划"

2. **设置显示器关闭时间：**
   - 设置"关闭显示器"为较短时间（如 5 分钟）
   - 这样会关闭屏幕但保持电脑运行

3. **禁用睡眠：**
   - 设置"使计算机进入睡眠状态"为"从不"
   - 确保 CC Connect 持续运行

### 快速设置（命令行）

以管理员身份运行 PowerShell：

```powershell
# 禁用睡眠
powercfg /change standby-timeout-ac 0
powercfg /change standby-timeout-dc 0

# 设置显示器关闭时间为5分钟
powercfg /change monitor-timeout-ac 5
powercfg /change monitor-timeout-dc 5
```

### 为什么需要这样设置

- ✅ **CC Connect 持续运行** - 服务在你离开时继续工作
- ✅ **节省能源** - 屏幕自动关闭
- ✅ **远程访问** - 仍可从手机与 AI 对话
- ✅ **不中断任务** - 长时间运行的任务不会被停止

---

## 🔑 关于密钥

### 自动生成的密钥（无需手动配置）

- **Management API Token** - Web UI 登录凭证
- **Bridge Token** - 内部通信凭证

### 需要手动获取的密钥

- **飞书 `app_id` / `app_secret`** - 在飞书开放平台创建应用后获取（或在 Web UI 中扫码）
- **企业微信 `bot_id` / `bot_secret`** - 在企业微信管理后台创建机器人后获取

---

## 📁 文件结构

```
cc-connect-优化版/
├── cc-connect-control.ps1          # 控制面板主脚本（中英文双语）
├── CC-Connect-启动器.vbs           # 启动器（中英文双语）
├── README.md                       # 英文说明文档
├── README.zh-CN.md                 # 中文说明文档（本文件）
├── config.example.toml             # 示例配置文件
└── docs/
    ├── feishu-setup.md             # 飞书接入指南
    └── wecom-setup.md              # 企业微信接入指南
```

---

## 📚 文档说明

- [飞书接入指南](docs/feishu-setup.md) - 如何接入飞书
- [企业微信接入指南](docs/wecom-setup.md) - 如何接入企业微信
- [原项目文档](https://github.com/chenhg5/cc-connect) - 完整文档

---

## 📧 联系方式

- GitHub: [cc-connect-optimized](https://github.com/yanlin-cheng/cc-connect-optimized)
- 邮箱: yanlin.cheng@foxmail.com

---

## 📄 许可证

MIT License - 基于 [CC Connect](https://github.com/chenhg5/cc-connect)
