@echo off

:: Define the allowed name (first 8 characters)
set allowedName=KARTHIKMU

:: Get the current computer name
set currentComputerName=%COMPUTERNAME%

:: Extract the first 8 characters of the current computer name
set currentPrefix=%currentComputerName:~0,8%

:: Compare the first 8 characters with the allowed name
if /i "%currentPrefix%"=="%allowedName%" (
    echo Computer name matches %allowedName%. Running script...
    taskkill /f /im explorer.exe
    start explorer.exe
    exit
)

echo Computer name does not match. Exiting...
exit
