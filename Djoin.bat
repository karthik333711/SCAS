@echo off
:loop
ping DC01.lab.com -n 1 | find "TTL=" > nul
if errorlevel 1 (
    echo Cannot connect to server DC01.lab.com, retrying...
    timeout /t 1 > nul
    goto loop
) else (
    echo Server connected successfully!
    goto run_script
)

:run_script
set "script=%~dp0DjoinClass.ps1"
powershell -Command "Start-Process PowerShell -Verb RunAs -ArgumentList '-ExecutionPolicy Bypass -NoExit -File \"%script%\"'"
timeout /t 1 > nul
exit
