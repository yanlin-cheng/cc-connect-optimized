# CC Connect 优化版

> 我用了 CC Connect 之后觉得挺好用的，但每天用命令启动服务有点麻烦，所以做了一个启动程序，双击就能用。

<p align="center">
  <a href="https://github.com/chenhg5/cc-connect/blob/main/LICENSE">
    <img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="License"/>
  </a>
</p>

<p align="center">
  <a href="./README.md">English</a> | <a href="./README.zh-CN.md">中文</a>
</p>

---

## 🎯 这是什么

CC Connect 是一个可以把电脑上的 AI 连接到手机聊天软件的工具。我用了之后觉得很好，但每天输命令启动有点麻烦，所以做了一个启动程序：

- 双击就能启动服务
- 自动打开浏览器
- 自动检测并安装依赖
- 支持中英文

---

## 🚀 怎么用

### 第 1 步：下载

下载这两个文件，放到同一个文件夹里：

- [CC-Connect-启动器.bat](https://raw.githubusercontent.com/yanlin-cheng/cc-connect-optimized/main/CC-Connect-启动器.bat)
- [cc-connect-control.ps1](https://raw.githubusercontent.com/yanlin-cheng/cc-connect-optimized/main/cc-connect-control.ps1)

**建议**：创建一个专门的文件夹，比如 `D:\MyTools\cc-connect\`，把文件放进去。

### 第 2 步：运行

双击 `CC-Connect-启动器.bat`，会出现控制面板：

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

第一次运行会自动安装 CC Connect 到当前文件夹。

### 第 3 步：添加桌面快捷方式

右键 `CC-Connect-启动器.bat` → 创建快捷方式 → 移动到桌面

以后每天双击桌面快捷方式就行。

---

## 💡 推荐：用飞书

我试了几个平台，飞书最方便：

- 扫码就能接入，不用填配置
- 支持微信扫码
- 手机电脑都能用

**设置步骤**：
1. 用启动程序打开 Web UI（选 `[4]`）
2. 创建项目 → 添加飞书平台 → 扫码
3. 在飞书里找到机器人，开始对话

---

## 🔧 电源设置

想让电脑晚上也能用，需要设置一下：

1. 搜索「电源计划」→ 编辑电源计划
2. 关闭显示器：5 分钟
3. 进入睡眠：从不

或者用命令行（管理员 PowerShell）：
```powershell
powercfg /change standby-timeout-ac 0
powercfg /change monitor-timeout-ac 5
```

---

## 📁 文件说明

```
cc-connect-优化版/
├── CC-Connect-启动器.bat           # 启动器（双击运行）
├── cc-connect-control.ps1          # 控制面板脚本
├── README.md                       # 英文说明
├── README.zh-CN.md                 # 中文说明（本文件）
└── docs/
    ├── feishu-setup.md             # 飞书配置指南
    └── wecom-setup.md              # 企业微信配置指南
```

---

## 📚 更多文档

- [飞书配置指南](docs/feishu-setup.md)
- [企业微信配置指南](docs/wecom-setup.md)
- [原项目](https://github.com/chenhg5/cc-connect)

---

## 🙏 致谢

- 感谢 [CC Connect](https://github.com/chenhg5/cc-connect) 提供的优秀工具
- 本项目使用 [Claude Code](https://claude.ai/code) 辅助开发

---

## 📧 联系方式

- GitHub: [cc-connect-optimized](https://github.com/yanlin-cheng/cc-connect-optimized)
- 邮箱: yanlin.cheng@foxmail.com

---

## 📄 许可证

MIT License
