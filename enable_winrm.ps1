# enable_winrm.ps1
winrm quickconfig -force
Set-Item -Path "WSMan:\localhost\Service\AllowUnencrypted" -Value $true
Set-Item -Path "WSMan:\localhost\Service\Auth\Basic" -Value $true

# Enable PS Remoting (creates firewall rule)
Enable-PSRemoting -Force

# Optional: Start WinRM service
Start-Service WinRM
Set-Service WinRM -StartupType Automatic

# Verify the listener is created
if (-not (Get-ChildItem -Path WSMan:\localhost\Listener)) {
    New-Item -Path WSMan:\localhost\Listener -Transport HTTP -Address * -Force
}
