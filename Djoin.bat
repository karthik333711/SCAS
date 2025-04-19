@echo off
:loop
ping DC01.lab.COM  -n 1 | find "TTL=" > nul
if errorlevel 1 (
    echo Cannot Connect Server DCA4.SCASA4.COM, retrying...
    timeout /t 1 > nul
    goto loop
) else (
    echo  Server Connected successfully!
    REM Go to A: drive
    goto A:
)

:A


powershell -Command "Start-Process PowerShell -ArgumentList '-ExecutionPolicy Bypass -NoExit -File ""%~dp0DjoinClass.ps1""' -Verb RunAs"



timeout /t 1 && exit


