$server = "DC01.LAB.COM"

# Wait until the server is reachable
while ($true) {
    if (Test-Connection -ComputerName $server -Count 1 -Quiet) {
        Write-Host "[$server] is reachable! Running script content..."

        # Rename the computer and join to the domain
        do {
            $newComputerName = Read-Host "Enter the new computer name"
        } while (-not $newComputerName)

        Write-Host "PC Name entered: $newComputerName"

        # Ask for confirmation
        $confirmation = Read-Host "New computer name is: $newComputerName. Press [Enter] to confirm, or type anything to cancel."

        if ($confirmation -ne "") {
            Write-Host "Aborted. No changes made."
            exit
        }

        Write-Host "Proceeding with the new computer name: $newComputerName"

        # Rename the computer
        Rename-Computer -NewName $newComputerName -Force

        # Convert the password to a secure string
        $securePassword = ConvertTo-SecureString '*171*&muru343' -AsPlainText -Force

        # Create the credential object
        $cred = New-Object System.Management.Automation.PSCredential ('lab\administrator', $securePassword)

        # Define parameters for Add-Computer
        $addComputerSplat = @{
            DomainName = 'lab.com'
            Credential = $cred
            Options    = 'JoinWithNewName', 'AccountCreate'
        }

        # Join the computer to the domain
        Add-Computer @addComputerSplat

        # Restart the computer to apply changes
        Restart-Computer

        break
    } else {
        Write-Host "Cannot connect to $server, retrying..."
        Start-Sleep -Seconds 1
    }
}
