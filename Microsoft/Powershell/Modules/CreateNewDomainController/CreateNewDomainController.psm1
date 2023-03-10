function CreateNewDomainController{

    SetEnvVariables
    
    # Install the Active Directory Domain Services (ADDS) role
    Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

    # Promote the server to a domain controller
    #$(get-variable -name )
    Install-ADDSForest 
    -CreateDnsDelegation:$false 
    -DatabasePath "C:\Windows\NTDS" 
    -DomainMode "WinThreshold" 
    -DomainName $env:DomName1 
    -DomainNetbiosName $env:DomNetBiosName
    -ForestMode "WinThreshold" 
    -InstallDns:$true 
    -LogPath "C:\Windows\NTDS" 
    -NoRebootOnCompletion:$false 
    -SysvolPath "C:\Windows\SYSVOL" 
    -Force:$true 
    -Credential (New-Object System.Management.Automation.PSCredential($env:DomAdminUser1, (ConvertTo-SecureString  $env:DomAdminPassword1 -AsPlainText -Force)))
}
    

  
