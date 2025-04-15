$TaskName = "RunScriptEvery5HoursAndStartup"
$ScriptPath = "C:\Windows\My\script.ps1"

$Action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoProfile -ExecutionPolicy Bypass -File `"$ScriptPath`""

$StartupTrigger = New-ScheduledTaskTrigger -AtStartup

# Use a realistic repetition duration (365 days)
$RepetitionDuration = [TimeSpan]::FromDays(365)
$FiveHourTrigger = New-ScheduledTaskTrigger -Once -At (Get-Date).AddMinutes(1) `
    -RepetitionInterval (New-TimeSpan -Hours 5) `
    -RepetitionDuration $RepetitionDuration

$Principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -RunLevel Highest

$Task = New-ScheduledTask -Action $Action -Principal $Principal -Trigger $StartupTrigger, $FiveHourTrigger

Register-ScheduledTask -TaskName $TaskName -InputObject $Task -Force
