Set WshShell = CreateObject("WScript.Shell")
scriptDir = CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName)

' Run PowerShell script from script directory
WshShell.Run "powershell -ExecutionPolicy Bypass -File """ & scriptDir & "\cc-connect-control.ps1""", 1, False
