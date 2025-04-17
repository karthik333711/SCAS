# Define the allowed prefixes or computer names (first 8 characters)
$allowedNames = @("scas-351", "KARTHIKMUR")

# Get the current computer name
$currentComputerName = $env:COMPUTERNAME

# Display the allowed names
Write-Host "Allowed computer names or prefixes:"
$allowedNames | ForEach-Object { Write-Host "- $_" }

# Check if the first 8 characters of the current computer name match any of the allowed names (case-insensitive)
if ($allowedNames -contains ($currentComputerName.Substring(0, 8).ToUpper())) {
    Write-Host "`nComputer name matches one of the allowed names. Running script..."
    
    # Stop the Explorer process
    Stop-Process -Name explorer -Force

    # Start the Explorer process
    Start-Process explorer
    
    Write-Host "Script completed."
} else {
    Write-Host "`nComputer name does not match any allowed names. Exiting..."
    exit
}
