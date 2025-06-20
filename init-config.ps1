$path = "$env:ProgramData\CloudInitFlag.txt"
'Cloud-init executed' | Out-File -FilePath $path -Force
