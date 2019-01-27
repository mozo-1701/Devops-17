# Installation av första AD och Domain services på VM-1 som DC-controlant.

Install-WindowsFeature AD-Domain-Services
Install-WindowsFeature DNS -IncludeAllSubFeature -IncludeManagementTools
  
Add-WindowsFeature RSAT-AD-AdminCenter,RSAT-ADDS-Tools

 # Installera första skog på första VM-1. 

Install-ADDSForest -CreateDnsDelegation:$false
-DatabasePath “C:\Windows\NTDS”
-DomainMode “Win2016”
-DomainName “local.com”
-DomainNetbiosName “YOURDOMAIN”
-ForestMode “Win2016”
-InstallDns:$true
-LogPath “C:\Windows\NTDS”
-NoRebootOnCompletion:$false
-SysvolPath “C:\Windows\SYSVOL”
-Force:$true