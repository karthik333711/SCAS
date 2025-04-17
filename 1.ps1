# Define the allowed prefixes (first 8 characters)
$allowedNames = @("scas-351", "KARTHIKMUR")

# Get the current computer name
$currentComputerName = $env:COMPUTERNAME

# Compare the first 8 characters (case-insensitive)
$currentPrefix = $currentComputerName.Substring(0, 8).ToUpper()

# Check if the current prefix matches any allowed names
if ($allowedNames -contains $currentPrefix) {
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
