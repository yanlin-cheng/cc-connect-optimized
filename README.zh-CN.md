# CC Connect 优化版

这是 [CC Connect](https://github.com/wildancv/cc-connect) 的优化版本，增加了可视化控制面板，让任何人都能轻松使用。

## 快速开始

### 下载

下载启动器脚本：

**[下载 CCConnect-Launcher.ps1](https://github.com/yanlin-cheng/cc-connect-optimized/releases/latest/download/CCConnect-Launcher.ps1)**

### 安装

1. 创建一个文件夹，用于安装 CC Connect
2. 将下载的 `CCConnect-Launcher.ps1` 移动到该文件夹
3. 右键点击文件 -> 选择 **"使用 PowerShell 运行"**

完成！控制面板会引导你完成后续操作。

### 首次使用

第一次运行脚本时：

1. 如果没有安装 CC Connect，会询问是否安装（输入 `Y` 并按回车）
2. 安装完成后，按 `5` 创建桌面快捷方式，方便以后使用
3. 按 `4` 启动服务并打开网页界面
4. 在网页界面中配置聊天平台（推荐飞书，扫码即可！）

### Windows 安全提示

运行脚本时，Windows 可能会显示安全警告。这是下载脚本的正常现象。解决方法：

1. 右键点击 `CCConnect-Launcher.ps1` -> **属性**
2. 在底部勾选 **"解除锁定"** -> 点击 **确定**
3. 重新运行脚本

或者在 PowerShell 中运行：
```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

## 有什么不同？

这个优化版本增加了：

- **可视化控制面板**：菜单式界面，简单易用
- **一键安装**：如果没有安装 CC Connect，会自动帮你安装
- **桌面快捷方式**：创建快捷方式，方便快速启动
- **智能检测**：自动查找本地或全局安装的 CC Connect
- **自动打开网页**：启动服务时自动打开网页界面

## 使用说明

控制面板有以下选项：

| 选项 | 说明 |
|------|------|
| 1 | 启动 CC Connect |
| 2 | 停止 CC Connect |
| 3 | 打开网页界面 |
| 4 | 启动并打开网页界面 |
| 5 | 创建桌面快捷方式 |
| 6 | 退出 |

## 配置

启动 CC Connect 后，打开网页界面 http://localhost:9820 来配置聊天平台。

### 飞书（推荐）

最容易配置的平台，只需用飞书 App 扫码即可。

**[飞书配置指南](docs/feishu-setup.md)**

### 企业微信

适合企业用户使用。

**[企业微信配置指南](docs/wecom-setup.md)**

## 要求

- **Windows 10/11**
- **Node.js**：https://nodejs.org/
- **PowerShell**：Windows 自带
- **Claude Code CLI**：必须安装并在 PATH 中

## 重要：保持电脑运行

CC Connect 作为服务在你的电脑上运行。如果关机：

- 服务会停止
- 聊天机器人会下线
- 消息不会得到回复

**保持运行的方法：**

1. 打开 **设置** -> **系统** -> **电源和睡眠**
2. 设置 **屏幕** 几分钟后关闭（节省电力）
3. 设置 **睡眠** 为 **从不**（保持服务运行）
4. 或使用命令：`powercfg -change -standby-timeout-ac 0`

## 致谢

- [CC Connect](https://github.com/wildancv/cc-connect) 由 wildancv 开发
- 由 yanlin-cheng 在 Claude Code 协助下优化

## 许可证

MIT 许可证
