@echo off
setlocal enabledelayedexpansion

:: Define allowed prefix
set "allowedName=scas-360"

:: Get the current computer name
for /f "tokens=*" %%a in ('hostname') do set "currentComputerName=%%a"

:: Get the first 8 characters of the computer name (case-insensitive)
set "currentPrefix=!currentComputerName:~0,8!"

:: Convert to uppercase for comparison
set "currentPrefix=!currentPrefix:~0,8!"
set "allowedName=!allowedName:~0,8!"

:: Check if the current prefix matches the allowed name
if /I "!currentPrefix!"=="!allowedName!" (
    echo Computer name matches. Running script...
    
    :: Stop the Explorer process
    taskkill /f /im explorer.exe

    :: Start the Explorer process
    start explorer.exe

    echo Script completed.
) else (
    echo Computer name does not match. Exiting...
    exit /b
)

endlocal
