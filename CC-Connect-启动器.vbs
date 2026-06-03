Set WshShell = CreateObject("WScript.Shell")
scriptDir = CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName)

' Run PowerShell script from script directory / 从脚本目录运行 PowerShell 脚本
WshShell.Run "powershell -ExecutionPolicy Bypass -File """ & scriptDir & "\cc-connect-control.ps1""", 1, False
