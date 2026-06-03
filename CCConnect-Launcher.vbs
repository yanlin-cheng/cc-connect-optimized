Set WshShell = CreateObject("WScript.Shell")
scriptDir = CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName)

' 运行 PowerShell 脚本
WshShell.Run "powershell -ExecutionPolicy Bypass -File """ & scriptDir & "\CCConnect-Launcher.ps1""", 1, False
