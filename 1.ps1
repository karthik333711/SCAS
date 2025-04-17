# Define the expected computer name
$expectedComputerName = "KARTHIK"

# Get the current computer name
$currentComputerName = $env:COMPUTERNAME

# Compare the current and expected computer names
if ($currentComputerName -eq $expectedComputerName) {
    Write-Host "Computer name matches. Running script..."
    
    # Stop the Explorer process
    Stop-Process -Name explorer -Force

    # Start the Explorer process
    Start-Process explorer
    
    Write-Host "Script completed."
} else {
    Write-Host "Computer name does not match. Exiting..."
    exit
}
