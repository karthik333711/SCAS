# Set the security protocol to TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Array of script URLs from GitHub (raw content)
$scriptUrls = @(
    "https://raw.githubusercontent.com/karthik333711/SCAS/main/1.bat",
    "https://raw.githubusercontent.com/karthik333711/SCAS/main/2.bat",
    "https://raw.githubusercontent.com/karthik333711/SCAS/main/3.bat",
    "https://raw.githubusercontent.com/karthik333711/SCAS/main/4.bat",
    "https://raw.githubusercontent.com/karthik333711/SCAS/main/5.bat",
    "https://raw.githubusercontent.com/karthik333711/SCAS/main/1.ps1",
    "https://raw.githubusercontent.com/karthik333711/SCAS/main/2.ps1",
    "https://raw.githubusercontent.com/karthik333711/SCAS/main/3.ps1",
    "https://raw.githubusercontent.com/karthik333711/SCAS/main/4.ps1",
    "https://raw.githubusercontent.com/karthik333711/SCAS/main/5.ps1"
)

# Temporary folder to store scripts
$tempFolder = "$env:TEMP\SCAS"
New-Item -ItemType Directory -Path $tempFolder -Force | Out-Null

# Loop through each URL
foreach ($url in $scriptUrls) {
    $fileName = Split-Path -Path $url -Leaf
    $localPath = Join-Path $tempFolder $fileName

    Write-Host "`n[+] Downloading: $url" -ForegroundColor Cyan
    try {
        Invoke-WebRequest -Uri $url -OutFile $localPath -UseBasicParsing

        Write-Host "[*] Executing: $fileName" -ForegroundColor Yellow
        if ($fileName -like "*.ps1") {
            PowerShell -ExecutionPolicy Bypass -File $localPath
        } elseif ($fileName -like "*.bat") {
            Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$localPath`"" -Wait
        } else {
            Write-Warning "[!] Skipped unknown file type: $fileName"
        }
    } catch {
        Write-Warning "[-] Failed to process $url. Error: $_"
    }
}

Write-Host "`n[✓] All scripts processed. Exiting." -ForegroundColor Green
exit
