$path = "$env:ProgramData\CloudInitFlag.txt"
'Cloud-init executed' | Out-File -FilePath $path -Force

Start-Transcript -Path "$env:ProgramData\cloudinit-log.txt" -Force
'Cloud-init executed' | Out-File -FilePath "$env:ProgramData\CloudInitFlag.txt" -Force
Stop-Transcript
