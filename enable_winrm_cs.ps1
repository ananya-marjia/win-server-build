# Enable WinRM
winrm quickconfig -quiet
Enable-PSRemoting -Force

# Allow Unencrypted (Optional, depends on your Ansible setup)
Set-Item -Path WSMan:\localhost\Service\AllowUnencrypted -Value $true

# Allow Basic Auth
Set-Item -Path WSMan:\localhost\Service\Auth\Basic -Value $true

# Enable listeners
$listener = winrm enumerate winrm/config/Listener
if ($listener -notmatch 'Transport = HTTP') {
    winrm create winrm/config/Listener?Address=*+Transport=HTTP
}

# Open firewall for WinRM
New-NetFirewallRule -Name "WinRM HTTP" -DisplayName "WinRM over HTTP" `
    -Protocol TCP -LocalPort 5985 -Action Allow

# Optional: restart WinRM service
Restart-Service WinRM
