$flagFile = "$env:windir\Temp\CloudInitFlag.txt"
"Cloud-init ran" | Out-File -FilePath $flagFile -Force