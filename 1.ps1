Write-Host "Restarting Windows Explorer..."
Stop-Process -Name explorer -Force
Start-Sleep -Seconds 2
Start-Process explorer.exe
Write-Host "Done."
