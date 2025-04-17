# Define the allowed prefixes or computer names (first 8 characters)
$allowedNames = @("scas-351", "KARTHIKMUR")

# Get the current computer name
$currentComputerName = $env:COMPUTERNAME

# Convert the first 8 characters of the computer name to uppercase for case-insensitive comparison
$currentPrefix = $currentComputerName.Substring(0, 8).ToUpper()

# Display the allowed names and match count
Write-Host "Allowed computer names or prefixes:"
$allowedNames | ForEach-Object { Write-Host "- $_" }

# Check how many allowed names match the first 8 characters of the computer name (case-insensitive)
$matchingCount = ($allowedNames | Where-Object { $_.ToUpper() -eq $currentPrefix }).Count

# If there are any matches, run the script
if ($matchingCount -gt 0) {
    Write-Host "`nComputer name matches $matchingCount allowed name(s). Running script..."

    # Stop the Explorer process
    Stop-Process -Name explorer -Force

    # Start the Explorer process
    Start-Process explorer

    Write-Host "Script completed."
} else {
    Write-Host "`nComputer name does not match any allowed names. Exiting..."
    exit
}
