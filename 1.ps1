# Define the expected first 8 letters of the computer name
$expectedPrefix = "KARTHIKM"

# Get the current computer name
$currentComputerName = $env:COMPUTERNAME

# Compare the first 8 characters of the current computer name
if ($currentComputerName.Substring(0, 8) -eq $expectedPrefix) {
    Write-Host "First 8 letters of computer name match. Running script..."
    
    # Stop the Explorer process
    Stop-Process -Name explorer -Force

    # Start the Explorer process
    Start-Process explorer
    
    Write-Host "Script completed."
} else {
    Write-Host "First 8 letters of computer name do not match. Exiting..."
    exit
}
