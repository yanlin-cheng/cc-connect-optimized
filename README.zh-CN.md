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
- 没有图形化界面管理
- 中英文用户需要分别使用不同版本

**我们的解决方案：**
- ✅ 可视化控制面板（PowerShell 脚本）
- ✅ 中英文双语界面，一个界面服务所有用户
- ✅ 一键启动/停止服务
- ✅ 一键打开 Web UI
- ✅ 双击即可运行，无需输入命令

---

## 🚀 快速开始

### 第 1 步：安装 CC Connect

```bash
npm install -g cc-connect
```

### 第 2 步：运行控制面板

**中文用户：** 双击 `启动CC-Connect控制面板.vbs`

**English Users:** Double-click `Start-CC-Connect.vbs`

### 第 3 步：启动服务

在控制面板中选择：
```
[4] Start + Open Browser
```

这会：
1. 启动 CC Connect 服务
2. 在浏览器中打开 Web UI（http://localhost:9820）

### 第 4 步：配置项目

1. 在浏览器中打开 Web UI
2. 使用 API Token 登录（首次运行时自动生成，见控制面板显示）
3. 创建你的项目
4. 设置工作目录（你的项目文件夹）

### 第 5 步：添加聊天平台

**飞书配置：**
1. 访问 [飞书开放平台](https://open.feishu.cn/)
2. 创建企业自建应用
3. 获取 `app_id` 和 `app_secret`
4. 在 Web UI 中添加飞书平台

**企业微信配置：**
1. 登录 [企业微信管理后台](https://work.weixin.qq.com/wework_admin/frame)
2. 创建智能机器人
3. 获取 `bot_id` 和 `bot_secret`
4. 在 Web UI 中添加企业微信平台

### 第 6 步：手机使用

1. 在手机上打开飞书/微信
2. 找到你的机器人
3. 开始对话！

---

## 💡 使用建议

### 创建桌面快捷方式（推荐）

测试成功后，建议创建桌面快捷方式：

1. 右键点击 `启动CC-Connect控制面板.vbs`
2. 选择"创建快捷方式"
3. 将快捷方式移动到桌面

### 日常使用流程

1. **早上：** 双击桌面快捷方式 → 选择 `[4] Start + Open Browser`
2. **使用：** 在手机上通过飞书/微信与 AI 对话
3. **晚上：** 在控制面板中选择 `[2] Stop Service`

---

## 🔑 关于密钥

### 自动生成的密钥（无需手动配置）

- **Management API Token** - Web UI 登录凭证
- **Bridge Token** - 内部通信凭证

### 需要手动获取的密钥

- **飞书 `app_id` / `app_secret`** - 在飞书开放平台创建应用后获取
- **企业微信 `bot_id` / `bot_secret`** - 在企业微信管理后台创建机器人后获取

---

## 📁 文件结构

```
cc-connect-优化版/
├── cc-connect-control.ps1          # 控制面板主脚本
├── Start-CC-Connect.vbs            # 英文启动器
├── 启动CC-Connect控制面板.vbs       # 中文启动器
├── 启动控制面板-中文.bat            # 批处理启动器
├── README.md                       # 英文说明文档
├── README.zh-CN.md                 # 中文说明文档（本文件）
├── config.example.toml             # 示例配置文件
└── docs/                           # 原项目文档
```

---

## 📚 更多文档

- [原项目](https://github.com/chenhg5/cc-connect)
- [飞书接入指南](docs/feishu.md)
- [企业微信接入指南](docs/wecom.md)
- [钉钉接入指南](docs/dingtalk.md)
- [Telegram 接入指南](docs/telegram.md)

---

## 📧 联系方式

- GitHub: [cc-connect-optimized](https://github.com/your-username/cc-connect-optimized)
- 邮箱: yanlin.cheng@foxmail.com

---

## 📄 许可证

MIT License - 基于 [CC Connect](https://github.com/chenhg5/cc-connect)
