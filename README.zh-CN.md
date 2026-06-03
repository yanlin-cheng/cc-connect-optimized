# CC Connect 优化版

> 我用了 CC Connect 这个项目之后觉得非常好，但有一点不方便，就是作为日常应用的话，用代码来启动和停止服务比较麻烦。所以我做了这个启动程序，让使用更方便。

<p align="center">
  <a href="https://github.com/chenhg5/cc-connect/blob/main/LICENSE">
    <img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="License"/>
  </a>
</p>

<p align="center">
  <a href="./README.md">English</a> | <a href="./README.zh-CN.md">中文</a>
</p>

---

## 🎯 为什么做这个

我用了 CC Connect 之后觉得非常好用，但有一点不方便：

- 每次都要打开终端，输入命令启动服务
- 启动后还要手动打开浏览器访问 Web UI
- 对于日常使用来说，这个流程太麻烦了

所以我就想，如果有一个程序，双击就能启动服务并打开浏览器，那该多方便！

---

## ✨ 这个程序能做什么

我做了一个启动程序，功能很简单：

1. **一键启动/停止服务** - 不用再输命令了
2. **启动服务的同时自动打开浏览器** - 省去手动操作
3. **自动检测并安装 CC Connect** - 如果没装会自动帮你装好
4. **支持中英文双语** - 中国人外国人都能用

---

## 🚀 怎么使用

### 第 1 步：下载程序

点击下载：[CC-Connect-启动器.vbs](CC-Connect-启动器.vbs)

### 第 2 步：放到你想安装的文件夹

**这一步很重要！** 建议你：

1. 创建一个新文件夹，比如 `D:\MyTools\cc-connect\`
2. 把下载的 VBS 文件放进去
3. CC Connect 会自动安装到这个文件夹里

**为什么要这样做？**
- 便于管理，所有文件都在一个地方
- 不会污染系统目录
- 想删除的时候直接删文件夹就行

### 第 3 步：双击运行

双击 `CC-Connect-启动器.vbs`，会出现一个控制面板：

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

**第一次运行时**，程序会自动检测是否安装了 CC Connect。如果没有，会自动帮你安装到当前文件夹。

### 第 4 步：添加到桌面快捷方式（推荐）

**这一步很关键！** 设置好之后，以后使用就非常方便了：

1. 右键点击 `CC-Connect-启动器.vbs`
2. 选择「创建快捷方式」
3. 把快捷方式移动到桌面
4. 可以重命名为「CC Connect」或「启动AI助手」

**以后每天的使用流程：**
- 早上：双击桌面快捷方式 → 选择 `[4]` → 服务启动，浏览器打开
- 晚上：选择 `[2]` → 服务停止

---

## 💡 推荐工作流：用飞书

我试了几个平台，发现**飞书是最方便的**，强烈推荐！

### 为什么推荐飞书？

- ✅ **扫码就能接入** - 不用填一堆配置
- ✅ **支持微信扫码** - 不需要注册飞书账号
- ✅ **配置最简单** - 比其他平台方便太多
- ✅ **手机电脑都能用** - 随时随地和 AI 对话

### 具体怎么操作？

1. **打开 Web UI**（用我们的启动程序，选择 `[4]`）
2. **创建项目** - 点击「项目」→「添加项目」
3. **添加飞书平台** - 点击「添加平台」→「飞书」→「扫码创建」
4. **扫码** - 用飞书 App 扫描二维码
5. **完成！** - 在飞书里找到机器人，开始对话

**就这么简单！** 比配置企业微信、钉钉什么的方便多了。

---

## 🔧 实测细节

### 1. 电源设置（重要！）

如果你想让电脑一直开着，晚上也能用手机和 AI 对话，需要设置一下电源选项：

**设置方法：**
1. 按 `Win + S`，搜索「电源计划」
2. 点击「编辑电源计划」
3. 设置「关闭显示器」为 5 分钟（省电）
4. 设置「使计算机进入睡眠状态」为「从不」（保持运行）

**或者用命令行（以管理员身份运行 PowerShell）：**
```powershell
# 禁用睡眠
powercfg /change standby-timeout-ac 0
powercfg /change standby-timeout-dc 0

# 设置显示器5分钟后关闭
powercfg /change monitor-timeout-ac 5
powercfg /change monitor-timeout-dc 5
```

**为什么要这样设置？**
- 屏幕会自动关闭，省电
- 但电脑不会睡眠，CC Connect 一直运行
- 你可以在手机上随时和 AI 对话

### 2. 使用 Web UI 界面

用我们的启动程序，选择 `[4] Start + Open Browser`，浏览器会自动打开 Web UI。

在 Web UI 里你可以：
- 创建和管理项目
- 添加聊天平台（飞书、微信等）
- 查看会话历史
- 配置各种设置

### 3. 建立项目对话空间

**建议每个项目单独建一个：**

1. 在 Web UI 里创建项目 A，绑定飞书机器人 A
2. 创建项目 B，绑定飞书机器人 B
3. 在飞书里，不同的机器人对应不同的项目

**这样做的好处：**
- 每个项目有独立的对话空间
- 不会混在一起
- 管理方便

---

## 📱 日常使用流程

**每天的使用流程：**

1. **早上上班：**
   - 双击桌面快捷方式
   - 选择 `[4] Start + Open Browser`
   - 浏览器自动打开 Web UI

2. **配置项目（如果需要）：**
   - 在 Web UI 里创建或切换项目
   - 添加飞书平台（扫码即可）

3. **使用：**
   - 在手机上打开飞书
   - 找到你的机器人
   - 开始对话！

4. **下班：**
   - 在控制面板选择 `[2] Stop Service`
   - 或者直接关掉控制面板窗口（服务会继续运行）

---

## 📁 文件结构

```
cc-connect-优化版/
├── cc-connect-control.ps1          # 控制面板主脚本（中英文双语）
├── CC-Connect-启动器.vbs           # 启动器（双击运行）
├── README.md                       # 英文说明文档
├── README.zh-CN.md                 # 中文说明文档（本文件）
├── config.example.toml             # 示例配置文件
└── docs/
    ├── feishu-setup.md             # 飞书接入指南
    └── wecom-setup.md              # 企业微信接入指南
```

---

## 📚 更多文档

- [飞书接入指南](docs/feishu-setup.md) - 详细配置步骤
- [企业微信接入指南](docs/wecom-setup.md) - 如果你想用企业微信
- [原项目](https://github.com/chenhg5/cc-connect) - 完整功能文档

---

## 📧 联系方式

- GitHub: [cc-connect-optimized](https://github.com/yanlin-cheng/cc-connect-optimized)
- 邮箱: yanlin.cheng@foxmail.com

---

## 📄 许可证

MIT License - 基于 [CC Connect](https://github.com/chenhg5/cc-connect)
